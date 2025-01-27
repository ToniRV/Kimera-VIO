disp('running script:')

appName = 'build/stereoVIOEuroc';

useSudo = 0;
if exist('useSudo', 'var') && useSudo == 0
    sudoName = '';
else
    sudoName = 'sudo ';
end

% setenv('LD_LIBRARY_PATH', '/opt/intel/parallel_studio_xe_2018/compilers_and_libraries_2018/linux/mkl/bin/mklvars.sh intel64')
% if initialFrameID ==-1 || finalFrameID == -1
%     % use default initial and final frame
%     % TODO change command to use gflags
%     myCommand = horzcat('%s../%s ',datasetPath,' ',filenameVioParams,' ',...
%         filenameTrackerParams,' > out-',num2str(i),'.txt');
% else
%  myCommand = horzcat('%s../%s ',datasetPath,' ',filenameVioParams,' ',...
%         filenameTrackerParams,' ',num2str(initialFrameID),' ',num2str(finalFrameID),...
%         ' > out-',num2str(i),'.txt');
% end

if (not(exist('initialFrameID')) || initialFrameID == -1)
    initialFrameID = 50;
end
if (not(exist('finalFrameID')) || finalFrameID == -1)
    finalFrameID = 10000;
end

myCommand = horzcat('%s../%s ', ...
'--dataset_path=', datasetPath, ...
' --vio_params_path=', filenameVioParams, ...
' --tracker_params_path=',  filenameTrackerParams, ...
' --logtostderr=1', ...
' --colorlogtostderr=1', ...
' --log_prefix=0', ...
' --backend_type=', num2str(runRegularVio), ... % backend_type: 0 for Normal VIO, 1 for Regular VIO.
' --regular_vio_backend_modality=4', ...
' --log_output=true', ...
' --visualize=false', ...
' --visualize_plane_constraints=false', ...
' --viz_type=5', ...
' --v=0', ...
' --vmodule=VioBackEnd=0,RegularVioBackEnd=0,Mesher=0', ...
' --add_extra_lmks_from_stereo=false', ...
' --visualize_histogram_1D=false', ...
' --visualize_histogram_2D=false', ...
' --visualize_mesh_2d_filtered=false', ...
' --max_triangle_side=0.5', ...
' --hist_2d_min_support=20', ...
' --initial_k=',  num2str(initialFrameID), ...
' --final_k=',  num2str(finalFrameID), ...
' &> out-', num2str(i),'.txt');

myCommand = sprintf(myCommand, sudoName, appName);

disp(myCommand)

if (system(myCommand) == 0)
    fprintf('stereoVIOExample completed successfully!\n')
else
    fprintf('stereoVIOExample Failed!\n')
end

%% Unfortunately, to run this in Matlab (only under ubuntu, we need to sudo)

%% Only for debugging
% system(horzcat('../build/stereoVIOExample ',datasetPath,' > out-',num2str(i),'.txt'));
% system(horzcat('sudo ../build/tests/testFrame'));

fprintf('Completed VIO run nr %d \n',i);