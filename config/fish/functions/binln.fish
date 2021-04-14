function binln
set -l d (pwd)
set -l mybin ~/.local/bin
if set -q user_bin
set -l mybin $user_bin
end
for i in $argv
ln -s $d/$i $mybin/(basename $i)
end
end
