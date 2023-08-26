### evaluation functions

"""
    argmin_func_newton(f, df, ddf, tmin, tmax; num_iters=10, length=100)

Find the minimum of a function `f` in the range `tmin:tmax` using Newton's method.
"""
function argmin_func_newton(f, df, ddf, tmin::AbstractFloat, tmax::AbstractFloat; num_iters::Int=10, length::Int=100)
    seed = argmin(f, range(tmin, tmax, length))
    root = newtons_method(df, ddf, seed, tmin, tmax; num_iters=num_iters)
    root
end

"""
    argmin_func_bisection(f, df, ddf, tmin, tmax; num_iters=10, length=100)

Find the minimum of a function `f` in the range `tmin:tmax` using the Bisection method.
"""
function argmin_func_bisection(f, df, tmin::AbstractFloat, tmax::AbstractFloat; num_iters::Int=10, length::Int=100)
    seed = argmin(f, range(tmin, tmax, length))
    Δ = 0.5 * (tmax - tmin) / length
    left = max(seed - Δ, tmin)
    right = min(seed + Δ, tmax)
    root = bisection_method(df, left, right; num_iters=num_iters)
    root
end

"""
    newtons_method(f, fgrad, root, rmin, rmax; num_iters=10, ϵ=0.5)

Uses Newton's method to find the root for the equation `f(root)=0`. 
If a function has multiple roots a good initial `root` is required to get an answer in the desired region.
"""
function newtons_method(f, fgrad, root::AbstractFloat, rmin::AbstractFloat, rmax::AbstractFloat; num_iters::Int=10, ϵ::AbstractFloat=0.3)
    grad = fgrad(root)
    if (abs(grad) < ϵ)
        @warn("gradient=$grad is too low for Newton's method. Returning seed without optimization.")
        return root
    end
    for i in 1:num_iters
        root = root - f(root) / fgrad(root)
        root = clamp(root, rmin, rmax)
    end
    root
end

"""
    bisection_method(f, left, right; num_iters=10).
"""
function bisection_method(f, left::AbstractFloat, right::AbstractFloat; num_iters::Int=10)
    if sign(f(left)) == sign(f(right))
        #@warn("sign(f(left)) == sign(f(right)). Returning middle without optimization.")
        return (left + right) / 2
    end
    for i in 1:num_iters
        middle = (left + right) / 2
        if sign(f(middle)) == sign(f(left))
            left = middle
        else
            right = middle
        end
    end
    (left + right) / 2
end
