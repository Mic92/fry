function fry-find --description 'Find ruby by name'
  set -l name $argv[1]
  set -l rubyless_name (echo $name | sed 's/^ruby-//')

  for i in (fry-ls | tail -r)
    switch $i
      case "$name*" "$rubyless_name*" "ruby-$name*"
        echo $i
        return
    end
  end

  return 1
end
