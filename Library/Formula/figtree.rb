require "formula"


class Figtree < Formula
  homepage "https://github.com/gadomski/figtree"
  head "https://github.com/gadomski/figtree.git"

  option "with-tests", "Build test suite"

  depends_on "cmake" => :build
  depends_on "ann" => :optional

  def install
    args = std_cmake_args
    if build.with? "tests"
      args += ["-DWITH_TESTS=true"]
    end
    system "cmake", ".", *args
    system "make", "install"
  end

  test do
    system "#{bin}/figtree-test"
  end
end
