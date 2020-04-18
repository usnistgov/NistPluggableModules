classdef circBuf < double
    % Creates a class of N-dimensional circular buffer of doubles that can
    % be handled identically to any other class of doubles (vectors, arrays
    % or matrices)
    
    methods 
        function obj = circBuf(x)
            obj = obj@double(x);
        end
        
        %-----------------------------------------------------------------
        % subsRef override to MATLAB's subcripted reference 
        function y = subsref(obj,x)
            switch x(1).type
                case '()'
                    objBuf = double(obj);
                    dimSizes = size(objBuf);
                    
                    %% column or row vector
                    if numel(dimSizes)<=2 && min(dimSizes)==1
                        dimSizes = max(dimSizes);
                    end
                    
                    %% Single object, access as a vector
                    if(numel(x(1).subs)==1)
                        dimSizes = numel(objBuf);
                    end
                    
                    %% throw an error if asking for dimensions not contained by the object
                    if(numel(x(1).subs)>numel(dimSizes))
                        error('Error(circBuf): index exceeds matrix dimensions.')
                    end
                    
                    %% access the matrix using modulo indices (this is what makes it cicular)
                    indices = x(1).subs;
                    for i=1:numel(indices)
                        if(~strcmp([x(1).subs{i}],':'))
                            indices{i} = mod(x(1).subs{i}-1,dimSizes(i))+1;
                        end
                    end
                    y = objBuf(indices{:});
                    
                    %% Error on mal-formed indices
                otherwise
                    error(['Error(circBuf): mal-formed indices ' x(1).type,' use brackets']);
            end
        end
        
        
         %-----------------------------------------------------------------
         % subasgn override for MATLAB's subscripted assignment
         function obj = subasgn(obj,x,data)
             switch x(1).type
                 case '()'
                     objBuf = double(obj);
                    dimSizes = size(objBuf);
                    
                    %% column or row vector
                    if numel(dimSizes)<=2 && min(dimSizes)==1
                        dimSizes = max(dimSizes);
                    end
                    
                    %% Single object, access as a vector
                    if(numel(x(1).subs)==1)
                        dimSizes = numel(objBuf);
                    end
                    
                    %% throw an error if asking for dimensions not contained by the object
                    if(numel(x(1).subs)>numel(dimSizes))
                        error('Error(circBuf): index exceeds matrix dimensions.')
                    end
                   
                    %% access the matrix using modulo indices (this is what makes it cicular)
                    indices = x(1).subs;
                    for i=1:numel(indices)
                        if(~strcmp([x(1).subs{i}],':'))
                            indices{i} = mod(x(1).subs{i}-1,dimSizes(i))+1;
                        end
                    end
                   objBuf(indices{:}) = data;
                   obj = circBuf(objBuf);
                   
                otherwise
                    error(['Error(circBuf): mal-formed indices ' x(1).type,' use brackets']);
             end
         end
    end
end

                   
                    
           