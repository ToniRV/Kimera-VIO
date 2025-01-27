function vioParams = defaultVioParams_sw()

%% VIO PARAMS:
% IMU PARAMS
vioParams.gyroNoiseDensity = 0.00016968; % given by specs
vioParams.accNoiseDensity = 0.002;  % given by specs
vioParams.gyroBiasSigma = 1.9393e-05;
vioParams.accBiasSigma = 0.003;
vioParams.imuIntegrationSigma = 1e-08;
vioParams.n_gravity = [0.0, 0.0, -9.81];
vioParams.nominalImuRate = 0.005;
% INITIALIZATION PARAMS
vioParams.autoInitialize = 0;
vioParams.roundOnAutoInitialize = 0;
vioParams.initialPositionSigma = 0.00001;
vioParams.initialRollPitchSigma = 10.0 / 180.0 * pi;
vioParams.initialYawSigma = 0.1 / 180.0 * pi;
vioParams.initialVelocitySigma = 1e-3;
vioParams.initialAccBiasSigma = 1e-1;
vioParams.initialGyroBiasSigma = 1e-2;
% VISION PARAMS
vioParams.linearizationMode = 0;
vioParams.degeneracyMode = 1;
vioParams.smartNoiseSigma = 3;
vioParams.rankTolerance = 1;
vioParams.landmarkDistanceThreshold = 20;
vioParams.outlierRejection = 8;
vioParams.retriangulationThreshold = 1e-3;
vioParams.addBetweenStereoFactors = 1;
vioParams.betweenRotationPrecision = 0.0;
vioParams.betweenTranslationPrecision = 1/(0.1*0.1);
% OPTIMIZATION
vioParams.relinearizeThreshold = 0.01;
vioParams.relinearizeSkip = 1;
vioParams.zeroVelocitySigma = 1e-3;
vioParams.noMotionPositionSigma = 1e-3;
vioParams.noMotionRotationSigma = 1e-4;
vioParams.constantVelSigma = 1e-2;
vioParams.numOptimize = 0; % !!! 
vioParams.horizon = 4; % !!!
vioParams.useDogLeg = 0;
