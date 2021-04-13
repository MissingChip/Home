function rmin
for arg in $argv
if test -d $arg
rm -r $arg/{*,.*}
end
end
end
