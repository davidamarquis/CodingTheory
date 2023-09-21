using Documenter, CodingTheory

# change to trigger bot

# root = "../",
# 	source = "src",
# 	build = "build",
Documenter.makedocs(
	clean = true,
	doctest = false,
	modules = Module[CodingTheory],
	repo = "",
	highlightsig = true,
	sitename = "Coding Theory Documentation",
	expandfirst = [],
    pages = ["Introduction" => "index.md",
		"Tutorials" => [
			"Tutorials/Linear Codes.md",
			"Tutorials/Cyclic Codes.md",
			"Tutorials/Quantum Codes.md"
    	],
		"Examples" => [
			"Examples/The Vardy-Be’ery Decomposition.md",
			"Examples/Quantum Reed-Muller Codes.md"
		],
		"Classical" => [
        	"Classical/linearcode.md",
			"Classical/concatenation.md",
        	"Classical/cycliccode.md",
        	"Classical/quasicyclic.md",
        	"Classical/GeneralizedReedSolomon.md",
        	"Classical/ReedMuller.md",
			"Classical/newcodesfromold.md",
			"Classical/productcodes.md",
        	"Classical/miscknowncodes.md"
    	],
		"LDPC" => [
			"LDPC/codes.md",
			"LDPC/Tannercodes.md",
			"LDPC/analysis.md",
			"LDPC/channels.md",
			"LDPC/decoders.md"
		],
    	"Quantum" => [
        	"Quantum/quantumcode.md",
			"Quantum/productcodes.md",
        	"Quantum/miscknowncodes.md"
    	],
    	"Misc" => [
        	"tilings.md",
        	"trellis.md",
        	"utils.md",
        	"weight_dist.md"
    	],
    	"References" => "references.md",
    	"Index" => "theindex.md"
    # "Developer Documentation" => [

    # ],
	]
		# "Linear Codes" => "linearcode.md",
		#      "Cyclic Codes" => "cycliccode.md",
		# 	 "Generalized Reed-Solomon Codes" => "GeneralizedReedSolomon.md",
		# 	 "Quasi-Cyclic Codes" => "quasicyclic.md",
		#      "Reed-Muller Codes" => "ReedMuller.md",
		#      "Miscellaneous Known Codes" => "miscknowncodes.md",
		# 	 "LDPC Codes" => "LDPC.md",
		# 	 "Tilings Of Surfaces" => "tilings.md",
		#      "Stabilizer Codes" => "quantumcode.md",
		#      "Miscellaneous Known Stabilizer Codes" => "miscknownquantumcodes.md",
		# 	 "Product Codes" => "productcodes.md",
		#      "Trellises" => "trellis.md",
		#      "Weight Enumerators, Distributions, And Minimum Distances" => "weight_dist.md",
		#      "Utilies" => "utils.md",
        #      "Index" => "theindex.md"]
)

deploydocs(repo = "github.com/esabo/CodingTheory.git", devbranch = "subsystem")
