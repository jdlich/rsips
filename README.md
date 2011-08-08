## Ruby sips
`sips` is an extremely fast image processing utility that ships with OS X. It is not nearly as robust as, say, ImageMagick, but therein lies the beauty.

**rsips** seeks to expand on `sips` (but not too much) and might prove to be helpful in your everyday scripting, Rakefiles, static compilers, etc.

## Install

	gem install rsips

## Basic Usage

	require 'rsips'

	image = Rsips::Image.new("photo.jpg")
	# => @width = "580", @height = "870"

	image.vertical? # => true
	
Long edge resizing

	image.resize 300
	# => @width = "200", @height => "300"

## More to Come...
