function sf = spline_interpolation(xs, ys, m_0, m_n)
    arguments
        xs (:, 1) {mustBeNumeric}
        ys (:, 1) {mustBeNumeric}
        m_0 (1, 1) {mustBeNumeric}
        m_n (1, 1) {mustBeNumeric}
    end
    assert(length(xs) == length(ys))
    N = length(xs);
    h = xs(2:N) - xs(1:(N - 1));
    diff = ys(2:N) - ys(1:(N - 1));
    lambda = 1 ./ (1 + h(1:(N - 2)) ./ h(2:(N - 1)));
    mu = 1 - lambda;
    g = 3 * (mu .* diff(2:(N - 1)) + lambda .* diff(1:(N - 2)));
    g(1) = g(1) - lambda(1) * m_0;
    g(N - 2) = g(N - 2) - mu(N - 2) * m_n;
    A = 2 * eye(N - 2);
    for i = 1:(N - 3)
        A(i, i + 1) = mu(i);
        A(i + 1, i) = lambda(i + 1);
    end
    m = A \ g;
    m = [m_0; m; m_n];
    syms x 'real'
    alpha1 = (1 + 2 * (x - xs(1:(N - 1))) ./ h) .* ((x - xs(2:N)) ./ h).^2;
    alpha2 = (1 + 2 * (xs(2:N) - x) ./ h) .* ((x - xs(1:(N - 1))) ./ h).^2;
    beta1 = (x - xs(1:(N - 1))) .* ((x - xs(2:N)) ./ h).^2;
    beta2 = (x - xs(2:N)) .* ((x - xs(1:(N - 1))) ./ h).^2;
    f = ys(1:(N - 1)) .* alpha1 + ys(2:N) .* alpha2 + m(1:(N - 1)) .* beta1 + m(2:N) .* beta2;
    sf = 0;
    for i = 1:(N - 1)
        sf = sf + (abs(heaviside(x - xs(i)) - heaviside(x - xs(i + 1)))) * f(i);
    end
    sf = matlabFunction(simplify(sf));
end
