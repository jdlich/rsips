## Ruby sips
`sips` is an extremely fast image processing utility that ships with OS X. It's not nearly as robust as ImageMagick but therein lies its beauty.

**rsips** seeks to expand on `sips` and make it fun to use in everyday scripting, Rakefiles, static compilers, etc.

## Install

	gem install rsips

## Basic Usage

	require 'rsips'

	image = Rsips::Image.new("photo.jpg")
	# => @pixelWidth = "580", @pixelHeight = "870"

	image.vertical? # => true
	
Long edge resizing

	image.resize 300 
	# => @pixelWidth = "200", @pixelHeight => "300"

## More to Come...
