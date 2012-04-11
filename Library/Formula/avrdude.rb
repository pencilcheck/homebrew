require 'formula'

class Avrdude < Formula
  head 'http://svn.savannah.nongnu.org/svn/avrdude/trunk/avrdude'
  homepage 'http://savannah.nongnu.org/projects/avrdude/'

  depends_on 'libusb-compat' if ARGV.include? '--with-usb'
  depends_on 'automake' unless File.exists? '/Developer'

  def options
    [['--with-usb', 'Compile AVRDUDE with USB support.']]
  end

  def install
    system "cd avrdude"
    system "./bootstrap"
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make"
    system "make install"
  end
end
