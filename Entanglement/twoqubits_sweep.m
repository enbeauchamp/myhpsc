% 2-qubit Max values Function - Sweep Method
%
% Function makes a vector of estimated maximum values associated with each value of
% alpha, a coefficient.  Maxima are estimated by choosing equally-spaced angles and
% for each, calculating the expectation value of the wavefunction,
% |psi> = alpha|00> + beta|11>
%
% Conditions: 0<=alpha<=1, 0<=beta<=1, alpha^2 + beta^2 = 1
% Input: number of intervals for alpha, m, and number of intervals for each of 8
% angles, n.
% Output: Vectors alpha and associated vector Max.
%
% Made by: Eric Beauchamp
% Date created: May 26, 2009
% Last modified: May 26, 2009

function [alpha, Max] = twoqubits_sweep(m,n)

twopi = 2*pi;
m = m+1;
n = n+1;

alpha = linspace(0,1,m);
beta = sqrt(1-(alpha.*alpha));
Max = zeros(size(alpha));
theta = linspace(0,pi,n);
phi = linspace(0,twopi,n);

tic
for a=1:n,
    theta1 = theta(a);
    costheta1 = cos(theta1);
    sintheta1 = sin(theta1);
       
    for b=1:n,
        theta1pr = theta(b);
        costheta1pr = cos(theta1pr);
        sintheta1pr = sin(theta1pr);
        
        for c=1:n,
            phi1 = phi(c);
            
            for d=1:n,
                phi1pr = phi(d);
                
                for e=1:n,
                    theta2 = theta(e);
                    costheta2 = cos(theta2);
                    sintheta2 = sin(theta2);
                    
                    for f=1:n,
                        theta2pr = theta(f);
                        costheta2pr = cos(theta2pr);
                        sintheta2pr = sin(theta2pr);
                        
                        for g=1:n,
                            phi2 = phi(g);
                            
                            for h=1:n,
                                phi2pr = phi(h);
                                
                                for i=1:m,
                                    val = (alpha(i)^2 + beta(i)^2)*(costheta1*costheta2 - costheta1*costheta2pr - costheta1pr*costheta2 - costheta1pr*costheta2pr) + 2*alpha(i)*beta(i)*(sintheta1*sintheta2*cos(phi1+phi2) - sintheta1*sintheta2pr*cos(phi1+phi2pr) - sintheta1pr*sintheta2*cos(phi1pr+phi2) - sintheta1pr*sintheta2pr*cos(phi1pr+phi2pr));
                                    
                                    if val > Max(i),
                                        Max(i) = val;
                                    end
                                
                                end
                            end
                        end
                    end
                end
            end   
        end
    end
end

toc