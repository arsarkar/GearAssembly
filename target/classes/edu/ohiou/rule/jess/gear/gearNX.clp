(import javax.vecmath.*)
(import edu.ohiou.labimp.gtk3d.*)
(import edu.ohiou.labimp.basis.*)
(import edu.ohiou.implanner.solid.*)
(import NXconnect.*)

;profile to draw gears
(defglobal ?*prof* = (new Prof2d))

;Crate new NXGear
(defglobal ?*nxgear* = (new GearConnect))

;Draw gears on the canvas 
; ?cx : center of gear x co-ord
; ?cy : center of gear y co-ord
; ?r  : radius of the gear
(deffunction draw-gear (?cx ?cy ?r)
	"Draw gear to the canvas"
    (bind ?g (new Arc2d (new Point2d ?cx ?cy) ?r))
	(?*prof* addCurve ?g) 
    ;insert gear in assembly
    (?*nxgear* setGear (* ?r 2) ?cx ?cy)
)

(deffunction display-gears ()
    ;display gears in applet
(?*prof* settApplet (new Draw2DApplet ?*prof*))
(?*prof* display)
;save assembly
(?*nxgear* makeGears "C:\\Users\\sarkara1\\Documents\\Core Java\\Workspace\\Jess-Arko\\src\\NXconnect\\Test1")    
)