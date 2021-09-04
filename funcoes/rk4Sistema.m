
function [t,y1,y2] = rk4Sistema(f1, f2, a, b, h, y1_0, y2_0)
    t = a:h:b
    n = length(t)
    y1(1) = y1_0
    y2(1) = y2_0
    for i = 1:n-1
        k1y1 = f1(t(i), y1(i), y2(i))
        k1y2 = f2(t(i), y1(i), y2(i))

        k2y1 = f1(t(i)+h/2, y1(i) + k1y1*h/2, y2(i) + k1y2*h/2)
        k2y2 = f2(t(i)+h/2, y1(i) + k1y1*h/2, y2(i) + k1y2*h/2)

        k3y1 = f1(t(i)+h/2, y1(i) + k2y1*h/2, y2(i) + k2y2*h/2)
        k3y2 = f2(t(i)+h/2, y1(i) + k2y1*h/2, y2(i) + k2y2*h/2)

        k4y1 = f1(t(i)+h/2, y1(i) + k3y1*h, y2(i) + k3y2*h)
        k4y2 = f2(t(i)+h/2, y1(i) + k3y1*h, y2(i) + k3y2*h)

        ky1 = (k1y1 + 2*k2y1 + 2*k3y1 + k4y1)/6
        ky2 = (k1y2 + 2*k2y2 + 2*k3y2 + k4y2)/6
    end
endfunction