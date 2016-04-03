# id3fix
Rename mp3 file using ID3 info

### Dependencies

* [mp3info](https://github.com/moumar/ruby-mp3info) gem

### Usage

```
id3fix.rb file [options]
    -r, --rename                     Rename the original file with ID3 tag info (format: Artist - Title)
    -h, --help                       Display Help
    -a, --artist artist              Change artist
    -t, --title title                Change title
```

### Alias
To use this script as fast command via Terminal just add this string to your `~/.bash_profile`:
```
alias id3fix="ruby /path/to/your/id3fix.rb"
```

Change `id3fix` to your own alias.

After these manipulations you can call this script like `id3fix some_song.mp3 --rename`.
