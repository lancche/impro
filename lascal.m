% calibrates the laser spot: 

clear all; close all;

set(0,'DefaultFigureWindowStyle','docked');

path_current = pwd; % displays current directory

dirn = '/users/fit/bosanac/PROJEKTI/PTEFb/data/FRAP/bleach_PROFILE/CycT1-GFP/25/2a';

cd(dirn); % enters chosen directory

post = imread('post5.tif');
pre = imread('pre.tif');

cd(path_current); % returns to "home" directory, before calling other scripts

screensize = get(0,'ScreenSize');

 lef = 250; 
 bot = 200; 
 wid = screensize(3)-600; 
 hei = screensize(4)-420;

akva = [0.49 1 0.83]; %svjetloplavo
red = [1 0 0];
siva = [0.4667 0.5333 0.6000];
nebo = [0 0.7490 1];
lila = [0.5176 0.4392 1];
menta = [0.4627 0.9333 0.7765];
sminka = [1 0.2510 0.2510];
soft = [0.9412 0.5020 0.5020];
roza = [1 0.0784 0.5765];
naranca = [1 0.2706 0];
barbika = [1 0.2431 0.5882];
cigla = [0.5569 0.1373 0.1373];
kricavo = [1.0000 0.2706 0];
zensko = [1 0.1882 0.1882];
sonce = [1 0.7255 0.0588];
sloboda = [0.7529 0 0];

laz;
