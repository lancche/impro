clear avint

for i = 1 : mt %iterating for each time point 
   
        % ESTIMATION OF BACKGROUND FOR SUBTRACTION 
        inb = find(gpic == i);
        intebkg = mean(inbkg(inb)); % the mean of the background intensity for the time step specified
        intebkgo(i) = intebkg;
        % ESTIMATE OF BLEACH OF ENTIRE PICTURES - as bkg maneovre
        intds = find(tcon == i); 
        intcaci = mean(con(intds));
        intcacio(i) = intcaci;
        intcac = (intcaci - intebkg)/(confac-ulbk); % normalized bleach factor
        intcaunt = intcac;
        intcaunto(i) = intcac(1);
        % EXCLUDING PROBLEMATIC AREAS FROM ANALYSIS: see 'analize.m'
        pinx = find(t == i); % pulling out indices corresponding to the time of i
        diso = dis(pinx);
        intaz = int(pinx);
        tjoj = t(pinx);
        xblez = xble(pinx);
        yblez = yble(pinx);
        
        [disjoj,ind] = sort(diso,'ascend'); %returns sorted matrix diss with the correspond.indices of dis
        intat = intaz(ind); % returns intensity sorted according to distance index
        xblet = xblez(ind);
        yblet = yblez(ind);

        %%%%%WWTTTTTFFFFFFFFFFFFFFFFFFFFFFFF
          if size(pinx) < max(excind)
           dd = max(excind) - size(pinx);
        excind(end-dd:end) = [];
        end
        
        disjoj(excind) = [];% (next 3lines) excludes outside of cell borders, estimated from first picture
        intat(excind) = [];
        tjoj(excind) = [];
        xblet(excind) = [];
        yblet(excind) = [];
         
        
         intam(i) = mean(inta);
        
        nare(i) = length(inta);
        
        % ANALYSIS OF BLEACHED CELL
        %corrected:
        
        inta = intat - intebkg; % background corrected
        
        intaat = inta./(intcac);
        
        %diss = disjoj - min(disjoj);
        
        diss = disjoj;
        
        st = floor((max(diss)-min(diss))/strip); % number of rings

    for j = 1 : st %counting the rings outwards
        
        indx = find((diss>strip*(j-1))&(diss<strip*j)); % j=1first ring, j=2second,etc.
        intensi = intaat(indx);
        
        xbleaj = xblet(indx);
        ybleaj = yblet(indx);
        
        xcor(indx,j) = xbleaj;
        ycor(indx,j) = ybleaj;
        
        si = sum(intensi)./length(intensi); 
        preals = ones(size(intensi));
        smea = si.*preals; % creating the mean intensity for strip matrix
        intensi = double(intensi);
        x(indx,j) = intensi./smea; % the weighing matrix of minimizing nucleoli effect for each strip
        
        weighted = intensi.*x(indx,j);   % nb from now this is relative value
         
       % avint(j) = mean(weighted);
        avnonw(j) = mean(intensi); 
        
        si = length(weighted);
        
        avint(j) = sum(weighted)./si;
    end 

        jm = [1:(size(avint,2))]';
        mi = ones(size(avint,2),1);
        d = [1:strip:(size(avint,2))*strip]; % create distance vector in strip jumps
        
        
        avinti(i,jm) = nfac.*avint';  
       %avinti(i, jm) = avint';
        
        jma = [1:(size(avnonw,1))];
%        avnonwi(i,jma)= avnonw;
        
        di(i,jm) = d;
        def = double(def);
        tm(i,jm) = def(i).*mi;
        
         disp(['Iteration ' num2str(def(i)) ' looped!']);
       % disp(['Iteration ' num2str(t(np*def(i))) ' looped!']);
        disp(' '); 
end
