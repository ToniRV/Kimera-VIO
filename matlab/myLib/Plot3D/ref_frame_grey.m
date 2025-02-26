% ref_frame plot a 3D representation of a reference frame 
% given by three unit vectors
% 
% ref_frame(Ref,DimSpace,OriginRef)
%  Ref is a 3 x 3 orthogonal matrix representing the unit vectors
%   of the reference frame to be drawn
%  DimSpace is a 3 x 2 matrix with min an max dimensions of the space
%   [xmin xmax; ymin ymax; zmin zmax]
%   default value = [-1,5 +1.5] for all dimensions
%  OriginRef is the reference frame origin point
%   default value = [0 0 0]'

%	Copright (C) Basilio Bona 2007

function ref_frame(Ref,OriginRef,colorCode,rhoRatio,stemRatio)

n=nargin;
if n == 1
    OriginRef=[0 0 0]';
    colorcode=['r','g','b'];
    rhoRatio=0.05;
    stemRatio=0.75;
end
if n == 2
    colorcode=['r','g','b'];
    rhoRatio=0.05;
    stemRatio=0.75;
end    
if n == 3 
    rhoRatio=0.05;
    stemRatio=0.75;
end    
if n == 4 
    stemRatio=0.75;
end    

% xproj=DimSpace(1,2); yproj=DimSpace(2,2); zproj=DimSpace(3,1);

%hold off;
arrow3D(OriginRef, Ref(:,1), colorcode(1), stemRatio, rhoRatio);
arrow3D(OriginRef, Ref(:,2), colorcode(2), stemRatio, rhoRatio);
arrow3D(OriginRef, Ref(:,3), colorcode(3), stemRatio, rhoRatio);
axis equal;   xlabel('X'); ylabel('Y'); zlabel('Z');
% lighting phong; 
% camlight left;
