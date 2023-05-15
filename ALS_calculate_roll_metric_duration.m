function duration = ALS_calculate_roll_metric_duration(data, option, min_angle, top)
% data ~ angle (roll)
% option = 1 - supinantion only
% option = 2 - pronation only
% option = 3 - supination and pronation
% min_angle = angle of flexion or extension
% top = number of fastest moves (default = 5);
% duration = average activity duration

fs = 10;
% margin = 10;

data_diff = diff(data);
data_diff(data_diff < 0.5 & data_diff > -0.5 | abs(data_diff) > 90) = 0;
data_sign = sign(data_diff);

duration = [];
if option == 1 % supination only
    % supination
    [running_length, move_duration, starting_index] = RunLength(data_sign);

    move_duration(running_length<1 | isnan(running_length))=[];
    starting_index(running_length<1 | isnan(running_length))=[];
    running_length(running_length<1 | isnan(running_length))=[];
    MinMax = nan(numel(running_length),4);
    for i = 1:numel(running_length)
        MinMax(i,:) = [data(starting_index(i)), data(starting_index(i)+move_duration(i)), starting_index(i), move_duration(i)];
    end
    
    % clear too small angles
%     MinMax(abs(MinMax(:, 2) - MinMax(:, 1)) < min_angle - margin | abs(MinMax(:, 2) - MinMax(:, 1)) > min_angle + margin, :) = [];
    MinMax(abs(MinMax(:, 2) - MinMax(:, 1)) < min_angle, :) = [];
    
    if ~isempty(MinMax)
        duration_temp = sort(MinMax(:,4), 'ascend');
        if size(MinMax, 1) >= top
            duration_temp = duration_temp(1:top);
        end
    else
        duration_temp = NaN;
    end
    duration = [duration; duration_temp];
elseif option == 2 % extension only
    % Pronation
    [running_length, move_duration, starting_index] = RunLength(data_sign);
    
    move_duration(running_length>-1 | isnan(running_length))=[];
    starting_index(running_length>-1 | isnan(running_length))=[];
    running_length(running_length>-1 | isnan(running_length))=[];
    MinMax = nan(numel(running_length),4);
    for j = 1:numel(running_length)
        MinMax(j,:) = [data(starting_index(j)), data(starting_index(j)+move_duration(j)), starting_index(j), move_duration(j)];
    end

    % clear too smal angles
%     MinMax(abs(MinMax(:, 2) - MinMax(:, 1)) < min_angle - margin | abs(MinMax(:, 2) - MinMax(:, 1)) > min_angle + margin, :) = [];
    MinMax(abs(MinMax(:, 2) - MinMax(:, 1)) < min_angle, :) = [];
    
    if ~isempty(MinMax)
        duration_temp = sort(MinMax(:,4), 'ascend');
        if size(MinMax, 1) >= top
            duration_temp = duration_temp(1:top);
        end
    else
        duration_temp = NaN;
    end
    duration = [duration; duration_temp];
elseif option == 3 % flexion and extension / supination and pronation
    % Flexion / supination
    [running_length, move_duration, starting_index] = RunLength(data_sign);

    move_duration(running_length<1 | isnan(running_length))=[];
    starting_index(running_length<1 | isnan(running_length))=[];
    running_length(running_length<1 | isnan(running_length))=[];
    MinMax = nan(numel(running_length),4);
    for i = 1:numel(running_length)
        MinMax(i,:) = [data(starting_index(i)), data(starting_index(i)+move_duration(i)), starting_index(i), move_duration(i)];
    end

    % clear too small angles
%     MinMax(abs(MinMax(:, 2) - MinMax(:, 1)) < min_angle - margin | abs(MinMax(:, 2) - MinMax(:, 1)) > min_angle + margin, :) = [];
    MinMax(abs(MinMax(:, 2) - MinMax(:, 1)) < min_angle, :) = [];
    
    if ~isempty(MinMax)
        duration_temp = sort(MinMax(:,4), 'ascend');
        if size(MinMax, 1) >= top
            duration_temp = duration_temp(1:top);
        end
    else
        duration_temp = NaN;
    end
    duration = [duration; duration_temp];
    
    % Extension / pronation
    [running_length, move_duration, starting_index] = RunLength(data_sign);
    
    move_duration(running_length>-1 | isnan(running_length))=[];
    starting_index(running_length>-1 | isnan(running_length))=[];
    running_length(running_length>-1 | isnan(running_length))=[];
    MinMax = nan(numel(running_length),4);
    for j = 1:numel(running_length)
        MinMax(j,:) = [data(starting_index(j)), data(starting_index(j)+move_duration(j)), starting_index(j), move_duration(j)];
    end
    
    % clear too small angles
    MinMax(abs(MinMax(:, 2) - MinMax(:, 1)) < min_angle, :) = [];
    
    if ~isempty(MinMax)
        duration_temp = sort(MinMax(:,4), 'ascend');
        if size(MinMax, 1) >= top
            duration_temp = duration_temp(1:top);
        end
    else
        duration_temp = NaN;
    end
    duration = [duration; duration_temp];
end

duration = mean(duration, 'omitnan')/fs;