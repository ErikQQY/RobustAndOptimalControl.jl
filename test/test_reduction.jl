using RobustAndOptimalControl: ControlSystems
using RobustAndOptimalControl, ControlSystems

sys = let
    _A = [-2.467030078096955 -1.7579086436230489 0.2642212618287617 -1.8139967744112642 0.9581654870157803 -1.1573282803258818 -2.409554294298775 1.2006959533714947 0.2661208318398341 0.9999177692959037 -0.3558865668962797 0.9416230396873052 -0.04719968633569187 1.9048861053182367 0.04105479772871481; 1.7913628319734 -2.762572481036251 1.1195768845996525 -0.5685580615144388 0.6726614103668934 1.0083399722116977 0.5812702064616616 -0.7829110624242633 -0.5724789585031453 0.2739159931739683 0.2757716078817949 -1.1772430269658822 -0.6381809965413997 -0.5567081736321586 0.3625746395689792; -0.005143392441108892 -1.7086991517875587 -1.717585106651333 1.5009119207685369 1.8738081845828842 -1.0939749683914888 -0.5264010960315267 0.22497823448076093 1.246044372509282 -0.5303445465251139 -0.5548425351067188 0.33884707949495035 0.5101563763162115 0.20539506245514677 0.26057781689650356; 0.604556580615853 1.2138308974005823 -2.059380841591183 -1.191665990395876 1.150735331516496 0.8110103414198591 -0.154085845809975 1.1119072467025846 0.11430616747450531 1.2819431451075372 0.921519933726758 0.4697140300022479 0.005096755657399703 -0.6758568389946026 0.23258764043708394; -0.3279280635059737 -0.3899618604207743 0.12657097470583745 0.8299061544706142 -2.6661102102915484 -0.33139258711550823 -0.012925000635212677 -0.42098301162071433 1.5144416025925511 -0.796229814982033 -0.0657636569172887 1.2193694935643702 -1.700730366738557 -0.480614226127818 0.5646449944635483; 0.2450793035368965 -1.8805339894110746 0.30667982435893143 0.9479179427233335 -1.2301806768500736 -3.136669168734015 -0.2481694826668052 0.380557579742639 -1.416193374954648 0.6987044103237035 -0.8853533466891377 -1.030250851383474 1.4525483702515944 0.36288849878688056 0.385057654662975; -2.0022001785391392 -0.2835451807794339 -0.26028704624052934 0.07217513465675776 0.08414471225474451 0.024542390758292842 -2.6763138550617667 0.011591697680752557 1.7133530919443034 0.17602929220838714 -0.6726695861811227 1.5441809892864893 -0.00015597605070589597 1.301000782058375 0.03551676106571688; -0.16249013289239514 0.13198122357867412 1.3236770560172366 0.3301510019655505 0.45179991512285006 0.07486588236983925 -1.6288494827036406 -1.5392724756838398 -0.6217318765063355 0.2858777881749128 -1.4166215418299406 -0.35825226416886896 1.8697114631330003 -0.3059163232549132 1.934355556146854; -0.3097986537718366 1.9026121572125902 -0.6714075159339921 -0.2504951318869757 -1.0960812903814519 0.551662724714743 -0.5206166054513874 -0.10057595046577751 -4.293450503414131 0.24751394898682735 0.5853194271595069 1.2157066833567851 -0.5437491323644809 0.03154589360470189 -1.3601989491821653; -1.8758967387335015 -0.08090769024414653 1.703446780809511e-5 -0.15226980080851651 -0.4474269369804122 -1.0627549839203736 1.1462306659249069 0.4825852860273927 1.1227319809099574 -2.5566746127781825 0.2744599619933535 1.514041120509779 0.8781499781073471 -0.7005275854271636 0.8540288603061493; 1.3102799390114126 2.0268412603985713 -0.26445369495117343 0.1673277757620624 0.33995168379334895 1.3424350975481887 -0.5262869773852599 1.772445455267548 0.7427203416097469 -0.6894548775913741 -4.648846973081957 0.6160480706048977 0.27693416312465485 -0.5843844597444985 -0.05046410580231136; -0.2667927151895562 -0.8394567537703295 0.7356804516400021 0.021352734365649183 1.6248465860949257 1.0375631106350516 -0.44557649819583367 -1.318671094466728 0.1198337174336245 0.028769936034846715 1.1651225420369067 -2.5802262184585376 -0.000961942820959872 0.3531297512430618 0.8801838685743447; -0.2340108920478918 -0.47020830048023965 0.0905085276240309 -1.159187923078835 -0.32263237957704327 -0.20398562485896923 -1.3882045935474685 0.6799676640930128 0.34600863452034686 -0.8950627077509554 0.37192323444628994 -0.17983996993004395 -3.254198004959321 -0.12498721862068969 -0.7674453121406706; -0.48890022859302995 0.7856693831160491 0.5530727968750053 0.28679439003867857 -0.353796629578632 1.3881939385941933 0.04935762134562992 -0.6880042763129538 1.3414828049193512 -1.6887109143288497 -0.846493928570519 -2.8372692994687916 -0.8703006934200097 -2.0491003542049913 -0.04580815825737827; 0.14776326405901308 -1.0181952707299127 0.17409898161459436 0.5045755253054325 1.2756549793646714 0.0513146326521474 1.9399237561334002 -1.3740316671021375 -1.6331290401813572 -0.4569927755409647 -0.6655757376846796 -0.11273958657543114 0.17478370341836297 0.9495603386771154 -2.069076828262977]
    _B = [-0.9890109448948233; 0.94489034588656; -0.6141178465083617; 0.16165201706201165; 0.3159060979974231; 0.48695887811075705; 1.4986210850273796; 0.20368746793706913; 0.30197970526128687; -0.8327748143726169; 0.5412418165171653; -0.6001356417667288; 0.9563775528650693; 3.0913194636365113; -0.34466316244242773]
    _C = [0.3132381087641251 -0.2983781324325293 -0.27755322605976035 0.722187317484002 0.10756083023764713 -0.8432926363233019 -1.2942110080251952 0.08989673121535467 -1.6845175332374567 -2.535783822800354 -0.6469091057919979 0.6817108268640213 -1.4395236987685638 -0.3003320643423357 0.49320084051761887]
    _D = [0.0]
    ss(_A, _B, _C, _D)
end
sysr = frequency_weighted_reduction(sys, 1, 1, 10)
@test sysr.nx == 10
@test norm(sys-sysr) < 1e-5
# bodeplot([sys, sysr])


# sys = ssrand(1,1,10, proper=true)
sys = let
    _A = [-3.2457568884577848 -0.9709881648628496 2.5986830066501487 0.10929577556477561 0.05027607854258857 0.27953443726273464 0.37869575253657956 -0.7415670467124911 -0.8723306000440615 0.9186219277892705; -0.67951689956761 -2.853540754527736 0.6121903826231613 2.167022775942329 -1.3362518751231087 0.27052292738707584 -0.41205997059440236 0.9675328597726843 -0.31902340467214135 -0.2624694054518293; -0.9693825264182581 0.2706161544633993 -1.433312733210014 -0.4195076769611032 0.4703049252849061 1.47290014682162 0.09970803641137543 -0.7189595131691185 -1.7372665057580614 0.6496704162176036; -0.7315165984188576 -3.438587829345989 -0.2646150665230416 -1.2369179161091948 -0.5714931604453887 0.2655752856563833 0.2244428073746226 1.3200417901754988 -0.5139418130660682 0.8869070876329531; 0.6678034518746887 -0.28242407386536494 -0.01306571590718952 0.8180780644546597 -1.5636655476823766 -1.432041330305812 -0.3186555690625707 0.4047899977465902 0.7766543740761176 1.1332916952645569; 1.0439462961677213 0.5603761347480476 -1.0673946370803042 2.065297667030172 2.0622680121683077 -1.5407850641702399 2.562320986628486 0.4291456610040989 -0.5853999459761943 0.17886564635348326; -0.13285626489018923 0.47503952348791406 1.105921739516141 1.0933062321124096 1.2703952887202579 -1.0825698120819383 -1.4243942957100129 -1.3994571653345012 0.6890508640402956 0.3244453993527589; -0.27988553587589793 -0.2865641537928437 -0.020379326141595905 -0.8113230885198695 -0.29383504852361897 -0.7637611675988282 0.29682298030397475 -4.065031083750159 0.5691551157574606 -1.8639256107234736; 0.4537930380958493 0.6614234998446303 -0.4277870018921912 1.7342323590344288 0.2542882624030592 0.002642962031894451 -1.1148591940907127 -0.9394549359866202 -2.262544410098742 -0.9420467603687506; -1.088408576121221 -0.13854618864389867 -0.9251283170605236 1.5905768356892043 0.011581927582191199 -2.4924299911211043 -0.4921574784104917 -0.10267947834304443 -0.5622726271236202 -2.499827020287407]
    _B = [2.109834811943383; 0.7122212935939083; 0.9477960944077879; -1.123537196617033; -0.5570048263462403; -0.6970324371311861; -0.6094269119334326; -0.5234946661946995; -0.18596966094535153; -0.4420098228227759]
    _C = [0.3210661400839473 -1.4299373597711122 -2.193683276878009 -1.7203675776227303 -0.8359692872531289 -0.438485194671709 -0.6987593761582938 -0.7233564542540655 -0.9744869837106208 -0.31839951662879357]
    _D = [0.0]
    ss(_A, _B, _C, _D)
end
sysi = fudge_inv(sys)
sysr = frequency_weighted_reduction(sys, sysi, 1, 5)
@test sysr.nx == 5
@test norm(sys-sysr) < 0.1
@test norm((sys-sysr)*sysi) < 0.05


## Controller reduction

A = [
    -0.015948101119319734 0.0 0.04185849126302005 0.0
    0.0 -0.011069870050970518 0.0 0.03334113387614947
    0.0 0.0 -0.04185849126302005 0.0
    0.0 0.0 0.0 -0.03334113387614947
]
B = [0.08325 0.0; 0.0 0.0628125; 0.0 0.04785714285714286; 0.031218750000000007 0.0]
C = [0.5 0.0 0.0 0.0; 0.0 0.5 0.0 0.0]
D = [0.0 0.0; 0.0 0.0]
G = ss(A, B, C, D)


A = [-0.001 0.0; 0.0 -0.001]
B = [1.0 0.0; 0.0 1.0]
C = [0.0999 0.0; 0.0 0.0999]
D = [0.1 0.0; 0.0 0.1]
WS = ss(A, B, C, D)


D = [0.01 0.0; 0.0 0.01]
WU = ss(D)


A = [-1.0 0.0; 0.0 -1.0]
B = [1.0 0.0; 0.0 1.0]
C = [-9.9 0.0; 0.0 -9.9]
D = [10.0 0.0; 0.0 10.0]
WT = ss(A, B, C, D)
P = hinfpartition(G, WS, WU, WT)

flag, C, γ = hinfsynthesize(P)

Pcl, S, CS, T = hinfsignals(P, G, C)

Cr = controller_reduction(P,C,7, false)
Cr2 = baltrunc(C,n=7)[1]
Pclr, Sr, CSr, Tr = hinfsignals(P, G, Cr)
Pclr2, Sr2, CSr2, Tr2 = hinfsignals(P, G, Cr2)
# bodeplot([Pcl, Pclr], plotphase=false, size=(1900,920))
# bodeplot([C, Cr, Cr2])

hinfn = ControlSystems._infnorm_two_steps_ct(Pcl-Pclr, :hinf, 1e-9, 1000, 1e-6)[1]
@test hinfn ≈ 14.88609988 rtol=1e-3
@test isstable(Pclr)


