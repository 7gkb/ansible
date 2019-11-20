if {[catch {package present Tcl 8.5.0}]} { return }
package ifneeded Tk 8.5.9	[list load [file join $dir .. .. .. lib64 libtk8.5.so] Tk]
