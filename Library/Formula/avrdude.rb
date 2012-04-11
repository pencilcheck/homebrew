require 'formula'

class Avrdude < Formula
  url 'http://download.savannah.gnu.org/releases/avrdude/avrdude-5.11.1.tar.gz'
  md5 '3a43e288cb32916703b6945e3f260df9'
  head 'http://svn.savannah.nongnu.org/svn/avrdude/trunk/avrdude'
  homepage 'http://savannah.nongnu.org/projects/avrdude/'

  depends_on 'libusb-compat' if ARGV.include? '--with-usb'
  depends_on 'automake' unless File.exists? '/Developer'

  def options
    [['--with-usb', 'Compile AVRDUDE with USB support.']]
  end

  def install
    if ARGV.build_head?
      md5 ''
      system "./bootstrap"
    end
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make"
    system "make install"
  end
end
