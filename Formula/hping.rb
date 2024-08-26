class Hping < Formula
  desc "Command-line oriented TCP/IP packet assembler/analyzer"
  homepage "https://github.com/antirez/hping"
  url "https://github.com/antirez/hping.git", branch: "master"
  version "3.0.0-alpha-1"
  sha256 "f5a671a62a11dc8114fa98eade19542ed1c3aa3c832b0e572ca0eb1a5a4faee8"

  depends_on "tcl-tk"

  uses_from_macos "libpcap"

  patch :DATA

  def install
    system "./configure"
    system "make", "CC=#{ENV.cc}", "COMPILE_TIME=-D__LITTLE_ENDIAN__"

    bin.install "hping3"
    bin.install_symlink "hping3" => "hping"
    bin.install_symlink "hping3" => "hping2"

    man8.install "docs/hping3.8"
  end

  test do
    # need sudo access
    assert_includes shell_output("#{bin}/hping -1 127.0.0.1 -c 3", 1), "can't open raw socket"
    assert_includes shell_output("#{bin}/hping --version"), "hping version 3.0.0-alpha-1"
  end
end

__END__
diff --git a/configure b/configure
index dab04ab..d1e7d1d 100755
--- a/configure
+++ b/configure
@@ -61,9 +61,9 @@ esac
 #
 # TCL detection
 #
-for TCLPATH_TRY in "/usr/bin/" "/usr/local/bin/" "/bin/"
+for TCLPATH_TRY in "/usr/bin/" "/usr/local/bin/" "/bin/" "/opt/homebrew/opt/tcl-tk/bin/"
 do
-	for TCLVER_TRY in "8.4" "8.3" "8.2" "8.1" "8.0"
+	for TCLVER_TRY in "8.4" "8.3" "8.2" "8.1" "8.0" "8.6"
 	do
 		if [ -z $TCLSH ]
 		then
@@ -81,7 +81,10 @@ then
 	TCL_VER=`echo puts \\$tcl_version | $TCLSH -`
 	USE_TCL='-DUSE_TCL'
 	TCL_LIB="-ltcl${TCL_VER}"
-	if [ -e /usr/include/tcl${TCL_VER} ]
+	if [ -e /opt/homebrew/opt/tcl-tk/lib/tcl${TCL_VER} ]
+	then
+		TCL_INC="-I/opt/homebrew/opt/tcl-tk/lib${TCL_VER}"
+	elif [ -e /usr/include/tcl${TCL_VER} ]
 	then
 		TCL_INC="-I/usr/include/tcl${TCL_VER}"
 	elif [ -e /usr/include/tcl.h ]
  