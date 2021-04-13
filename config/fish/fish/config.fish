
set -l EXTRA_PATH ~/.cargo/bin

for i in $EXTRA_PATH
    if not contains $i $PATH
        set -gx PATH $PATH $i
    end
end

if status --is-login 
    # Don't do anything yet, but maybe some day
end

