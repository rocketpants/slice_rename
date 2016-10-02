# Slice Rename
Slice an image and give each slice a specific name.

# Usage
The CLI takes two arguments, the path to the image to be sliced and a
configuration file. The output will be placed in the same folder as the input
image. If you don't provide a configuration file it will use default settings
which aren't useful for anything.

The `fallback` argument can be used if you are combining slices but are missing
some slices for the specific variation. When combining slices it will first
look for a file based on the input path (name + suffix), if it doesn't find a
file that way it will use the fallback (fallback + suffix).

```
-c, --config MANDATORY  Configuration file (see below)
-k, --combine           Combine all slices to one image
-f, --fallback		A base name used if a file can't be found
-d, --debug             Output debug info
-v, --version           Display the version
-h, --help              Display this message
```

## Configuration
See the example which is located at `spec/fixtures/config_example.yml`. The
suffixes aren't mandatory, if you skip them or don't provide enough it will use
an auto generated suffix instead (`_00`).

* `rows` - defaults to `1`

	The number of rows in the image that you are slicing up or combining.

* `columns` - defaults to `1`

	The number of columns in the image that you are slicing up or combining.

* `width` - defaults to `16`

	The width of the individual slices in your image.

* `height` - defaults to `16`

	The height of the individual slices in yout image.

* `padding` - defaults to `0`

	The padding that is around each individual slice. See `collapse_padding`
for more details on how the padding works.

* `collapse_padding` - defaults to `false`

	The option called `collapse_padding` specifies if the padding between
images are collapsed into eachother. Meaning that if the `padding` setting is 2
and `collapse_padding` is true then it expects all images to be separated by 2
pixels. If `collapse_padding` is false it will instead expect 2 pixels around
each image resulting in 4 pixels between images but only 2 around the whole
image.

	Images created by slice_rename do not collapse the padding so
`collapse_padding` defaults to `false`. If you need the old behaviour simply
set it to `true` in your config file.

* `padding_color` - defaults to `none`

	The color of the padding around your individual slices. The default is
transparent, if you want a color pass a hex color code. Keep in mind that you
need quotes since the `#` character is reserved for comments in YAML.

* `background_color` - defaults to `none`

	The color of the background behind your individual slices. The default
is transparent, if you want a color pass a hex color code.

* `debug` - defaults to `false`

	When set to true slice_rename will spit out the arguments that get sent
to ImageMagick, this can be helpful for finding problems.

# About Rocket Pants
![Rocket Pants](http://rocketpants.se/logo_xsmall.png)

Rocket Pants is a small indie game studio based in Stockholm. If you like this
tool please consider supporting us by checking out our games. Find out more at
[rocketpants.se](http://rocketpants.se).

# Contributing
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

The sample image is part of a duty free asset pack from
[kenney.nl](http://kenney.nl/).
