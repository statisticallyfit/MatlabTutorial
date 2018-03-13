function printProjectilePosition(t, v0, theta0)
    [x, y] = projectilePosition(t, v0, theta0);
    
    fprintf('For a projectile with initial position v0 = %.2f, and initial angle\n', v0)
    fprintf('of theta0 = %.2f, at time t = %.2f, the projectile has a position of\n', theta0, t)
    fprintf('x = %.2f, and y = %.2f.\n', x, y)
end