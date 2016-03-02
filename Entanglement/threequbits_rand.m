% 3-qubit Max values Function
%
% Function makes a vector of estimated maximum values associated with each value of
% alpha, a coefficient.  Maxima are estimated by randomly choosing values
% for 12 angles and determining the expectation value of the wavefunction,
% |psi> = alpha|000> + beta|111>
%
% Conditions: 0<=alpha<=1, 0<=beta<=1, alpha^2 + beta^2 = 1
% Input: number of divisions of alpha, m, and number of samples for each of
% 12 angles, n.
% Output: Vectors alpha and associated vector Max.
%
% Made by: Eric Beauchamp
% Date created: May 23, 2009
% Last modified: May 23, 2009

function [alpha, Max] = threequbits(m,n)

alpha = linspace(0,1,m+1);
beta = sqrt(1-(alpha.*alpha));
Max = zeros(size(alpha));
twopi = 2*pi;

tic
for a=1:n,
    theta1 = unifrnd(0,pi);
    costheta1 = cos(theta1);
    sintheta1 = sin(theta1);
       
    for b=1:n,
        theta1pr = unifrnd(0,pi);
        costheta1pr = cos(theta1pr);
        sintheta1pr = sin(theta1pr);
        
        for c=1:n,
            phi1 = unifrnd(0,twopi);
            
            for d=1:n,
                phi1pr = unifrnd(0,twopi);
                
                for e=1:n,
                    theta2 = unifrnd(0,pi);
                    costheta2 = cos(theta2);
                    sintheta2 = sin(theta2);
                    
                    for f=1:n,
                        theta2pr = unifrnd(0,pi);
                        costheta2pr = cos(theta2pr);
                        sintheta2pr = sin(theta2pr);
                        
                        for g=1:n,
                            phi2 = unifrnd(0,twopi);
                            
                            for h=1:n,
                                phi2pr = unifrnd(0,twopi);
                                
                                for i=1:n;
                                    theta3 = unifrnd(0,pi);
                                    costheta3 = cos(theta3);
                                    sintheta3 = sin(theta3);
                                    
                                    for j=1:n;
                                        theta3pr = unifrnd(0,pi);
                                        costheta3pr = cos(theta3pr);
                                        sintheta3pr = sin(theta3pr);
                                        
                                        for k=1:n;
                                            phi3 = unifrnd(0,twopi);
                                            
                                            for l=1:n;
                                                phi3pr = unifrnd(0,twopi);
                                
                                                for o=1:m+1,
                                                    val = (beta(o)^2 - alpha(o)^2)*(costheta1*costheta2*costheta3 - costheta1*costheta2*costheta3pr - costheta1*costheta2pr*costheta3 - costheta1*costheta2pr*costheta3pr - costheta1pr*costheta2*costheta3 - costheta1pr*costheta2*costheta3pr - costheta1pr*costheta2pr*costheta3 + costheta1pr*costheta2pr*costheta3pr) + 2*alpha(o)*beta(o)*(sintheta1*sintheta2*sintheta3*cos(phi1+phi2+phi3) - sintheta1*sintheta2*sintheta3pr*cos(phi1+phi2+phi3pr) - sintheta1*sintheta2pr*sintheta3*cos(phi1+phi2pr+phi3) - sintheta1*sintheta2pr*sintheta3pr*cos(phi1+phi2pr+phi3pr) - sintheta1pr*sintheta2*sintheta3*cos(phi1pr+phi2+phi3) - sintheta1pr*sintheta2*sintheta3pr*cos(phi1pr+phi2+phi3pr) - sintheta1pr*sintheta2pr*sintheta3*cos(phi1pr+phi2pr+phi3) + sintheta1pr*sintheta2pr*sintheta3pr*cos(phi1pr+phi2pr+phi3pr));

                                                    if val > Max(o),
                                                        Max(o) = val;
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
            end   
        end
    end
end

toc