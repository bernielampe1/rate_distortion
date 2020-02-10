function plot_rd()
    % plot theta 0.1 to 0.5
    for theta = 0.1:0.1:0.5
        load(strcat('vars_', num2str(theta), '.mat'));

        figure;
        plot(D(1, :), R_D(1, :), '-o', D(2, :), R_D(2, :), '-s', D(3, :), R_D(3, :), '-+', D(4, :), R_D(4, :), '-d', D(5, :), R_D(5, :), '-*');
        legend('N=10', 'N=20', 'N=30', 'N=40', 'N=50');
        xlabel('Distoration = D');
        ylabel('Distoration Rate = R(D)');
        title(strcat('Theta =', ' ', num2str(theta)));
        ylim([0 4]);
        grid on;
        print('-dpng', strcat('plot_',num2str(theta), '.png'));
    end

    % plot N 10 to 50
    i=1;
    for N = 10:10:50
        j = 1;
        D1 = zeros(5, length(D(1,:)));
        R_D1 = zeros(5, length(R_D(1, :)));
        for theta = 0.1:0.1:0.5
            load(strcat('vars_', num2str(theta), '.mat'));
            D1(j,:) = D(i,:);
            R_D1(j,:) = R_D(i,:);
            j = j + 1;
        end
        i = i + 1;
        plot(D1(1, :), R_D1(1, :), '-o', D1(2, :), R_D1(2, :), '-s', D1(3, :), R_D1(3, :), '-+', D1(4, :), R_D1(4, :), '-d', D1(5, :), R_D(5, :), '-*');
        legend('theta=0.1', 'theta=0.2', 'theta=0.3', 'theta=0.4', 'theta=0.5');
        xlabel('Distoration = D');
        ylabel('Distoration Rate = R(D)');
        title(strcat('N =', ' ', num2str(N)));
        ylim([0 4]);
        grid on;
        print('-dpng', strcat('plot_',num2str(N), '.png'));
    end
end