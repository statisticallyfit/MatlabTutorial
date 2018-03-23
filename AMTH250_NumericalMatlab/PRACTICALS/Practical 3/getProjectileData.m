function [v0, theta0, t] = getProjectileData()

    v0 = input('Enter initial speed (m/s): ');
    while ~isnumeric(v0) || ~isscalar(v0) || v0 < 0
        disp('You must enter non-neg real num for initial speed.');
        v0 = input('again: ');
    end
    
    theta0 = input('Enter departure angle (radians): ');
    while ~(isnumeric(theta0) && isscalar(theta0))
        disp('You must enter a real number for the angle of departure.');
        theta0 = input('Enter the angle of departure (radians): ');
    end
        
    t = input(['After how many seconds do you wish to know the projectile''s ' ...
    'position? ']);
    while ~(isnumeric(t) && isscalar(t) && t >= 0)
        disp('You must enter a non-negative real number for the time.');
        t = input(['After how many seconds do you wish to know the ' ...
        'projectile''s position? ']);
    end
end