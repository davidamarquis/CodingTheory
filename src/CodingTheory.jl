module CodingTheory
    # change environment variable so that banner doesn't print
    ENV["NEMO_PRINT_BANNER"] = "false"

    using AbstractAlgebra
    using Nemo
    using Reexport

    #############################
             # utils.jl
    #############################

    module UtilsMod
        using AbstractAlgebra
        using Nemo

        import LinearAlgebra: tr

        include("utils.jl")
        export kroneckerproduct, Hammingweight, weight, wt, Hammingdistance, distance,
            dist, tr, expandmatrix, symplecticinnerproduct, aresymplecticorthogonal,
            Hermitianinnerproduct, Hermitianconjugatematrix, FpmattoJulia, istriorthogonal,
            printstringarray, printchararray, printsymplecticarray, pseudoinverse,
            quadratictosymplectic, symplectictoquadratic, _processstrings,
            _Paulistringtosymplectic, _removeempty!
    end
    @reexport using CodingTheory.UtilsMod

    #############################
           # cyclotomic.jl
    #############################

    module CyclotomicMod
        using AbstractAlgebra
        using Nemo

        include("cyclotomic.jl")
        export ord, cyclotomiccoset, allcyclotomiccosets, complementqcosets,
            qcosetpairings, qcosetpairings, qcosettable, dualqcosets
    end
    @reexport using CodingTheory.CyclotomicMod

    #############################
           # linearcode.jl
    #############################

    module LinearCodeMod
        using AbstractAlgebra
        using Nemo
        using CodingTheory.UtilsMod

        import Base: show, length, in, ⊆, /, *, ==, ∩, +
        import AbstractAlgebra: quo, VectorSpace
        import Nemo: isprime, factor, transpose

        abstract type AbstractCode end
        abstract type AbstractLinearCode <: AbstractCode end
        export AbstractCode, AbstractLinearCode

        include("linearcode.jl")
        export WeightEnumerator, LinearCode, field, length, dimension, cardinality, rate, setminimumdistance!,
            relativedistance, generatormatrix, originalgeneratormatrix, paritycheckmatrix,
            originalparitycheckmatrix, genus, Singletonbound, numbercorrectableerrors,
            encode, syndrome, in, ⊆, ⊂, issubcode, codecomplement, quo, quotient, /, dual,
            Hermitiandual, isequivalent, isselfdual, isselforthogonal, isweaklyselfdual, ⊕,
            directsum, ⊗, kron, tensorproduct, directproduct, productcode, extend, puncture,
            expurgate, augment, shorten, lengthen, uuplusv, Plotkinconstruction, subcode,
            juxtaposition, constructionX, constructionX3, upluswvpluswuplusvplusw,
            entrywiseproductcode, *, Schurproductcode, Hadamardproductcode,
            componentwiseproductcode, VectorSpace, _standardform,
            expandedcode, subfieldsubcode, tracecode, evensubcode, permutecode,
            words, codewords, elements
    end
    @reexport using CodingTheory.LinearCodeMod

    #############################
          # ReedMuller.jl
    #############################

    module ReedMullerMod
        using AbstractAlgebra
        using Nemo
        using CodingTheory.LinearCodeMod

        abstract type AbstractReedMullerCode <: AbstractLinearCode end
        export AbstractReedMullerCode

        import CodingTheory.LinearCodeMod: dual, entrywiseproductcode, *,
            Schurproductcode, Hadamardproductcode, componentwiseproductcode

        include("ReedMuller.jl")
        export order, RMr, RMm, ReedMullergeneratormatrix, ReedMullerCode
    end
    @reexport using CodingTheory.ReedMullerMod

    #############################
           # cycliccode.jl
    #############################

    module CyclicCodeMod
        using AbstractAlgebra
        using Nemo
        using CodingTheory.LinearCodeMod
        using CodingTheory.CyclotomicMod

        import Base: show, length, in, ⊆, /, *, ==, ∩, +

        abstract type AbstractCyclicCode <: AbstractLinearCode end
        abstract type AbstractBCHCode <: AbstractCyclicCode end
        abstract type AbstractReedSolomonCode <: AbstractBCHCode end
        export AbstractCyclicCode, AbstractBCHCode, AbstractReedSolomonCode

        include("cycliccode.jl")
        export definingset, splittingfield, polynomialring, primitiveroot, offset,
            designdistance, qcosets, qcosetsreps, generatorpolynomial, paritycheckpolynomial,
            idempotent, isprimitive, isnarrowsense, isreversible, finddelta, dualdefiningset,
            CyclicCode, BCHCode, ReedSolomonCode, complement, ==, ∩, +
    end
    @reexport using CodingTheory.CyclicCodeMod

    #############################
         # miscknowncodes.jl
    #############################

    module MiscKnownCodesMod
        using AbstractAlgebra
        using Nemo
        using CodingTheory.LinearCodeMod

        include("miscknowncodes.jl")
        export RepetitionCode, Hexacode, HammingCode, TetraCode, SimplexCode,
            GolayCode, ExtendedGolayCode
    end
    @reexport using CodingTheory.MiscKnownCodesMod

    #############################
          # quantumcode.jl
    #############################

    module QuantumCodeMod
        using AbstractAlgebra
        using Nemo
        using CodingTheory.UtilsMod
        using CodingTheory.LinearCodeMod

        import Base: show, length, in, ⊆, /, *, ==, ∩, +
        import CodingTheory.LinearCodeMod: field, dimension, rate, syndrome,
            cardinality

        abstract type AbstractAdditiveCode <: AbstractCode end
        abstract type AbstractStabilizerCode <: AbstractAdditiveCode end
        abstract type AbstractCSSCode <: AbstractStabilizerCode end
        export AbstractAdditiveCode, AbstractStabilizerCode, AbstractCSSCode

        include("quantumcode.jl")
        export field, quadraticfield, length, numqubits, dimension, cardinality,
            rate, signs, Xsigns, Zsigns, stabilizers, symplecticstabilizers,
            Xstabilizers, Zstabilizers, numXstabs, numZstabs, normalizermatrix,
            charactervector, setminimumdistance, relativedistance, splitstabilizers,
            isCSS, CSSCode, QuantumCode, logicalspace, setlogicals!, changesigns!,
            Xsyndrome, Zsyndrome, syndrome, allstabilizers, elements
    end
    @reexport using CodingTheory.QuantumCodeMod

    #############################
     # miscknownquantumcodes.jl
    #############################

    module MiscKnownQuantumCodesMod
        using AbstractAlgebra
        using Nemo
        using CodingTheory.QuantumCodeMod

        include("miscknownquantumcodes.jl")
        export fivequbitcode, Q513, Steanecode, Q713, _Steanecodetrellis, Shorcode, Q913,
            Q412, Q422, Q511, Q823, Q15RM, Q1513, Q1573, triangularsurfacecode,
            rotatedsurfacecode, XZZXsurfacecode, tricolorcode488, tricolorcode666
    end
    @reexport using CodingTheory.MiscKnownQuantumCodesMod

    #############################
            # trellis.jl
    #############################

    module TrellisMod
        using AbstractAlgebra
        using Nemo
        using CodingTheory.UtilsMod
        using CodingTheory.LinearCodeMod
        using CodingTheory.QuantumCodeMod

        import Base: ==, length

        include("trellis.jl")
        export Trellis, vertices, edges, isisomorphic, isequal, loadbalancedecode,
            trellisorientedformlinear,trellisprofiles, syndrometrellis,
            trellisorientedformadditive, optimalsectionalizationQ, weightQ!,
            shiftandweightQ!, shiftanddecodeQ!, shift!, isshifted
    end
    @reexport using CodingTheory.TrellisMod

    #############################
         # weight_dist.jl
    #############################

    module WeightDistMod
        using AbstractAlgebra
        using Nemo
        using CodingTheory.LinearCodeMod
        using CodingTheory.QuantumCodeMod
        using CodingTheory.TrellisMod

        import Base: -, ==, show

        include("weight_dist.jl")
        export weightenumeratorC, weightenumerator, weightdistribution, minimumdistance,
            Pauliweightenumerator, Pauliweightenumerator, PWEtoHWE, PWEtoXWE, PWEtoZWE,
            HammingweightenumeratorQ, Hammingweightenumerator, weightenumerator,
            weightdistribution, CWEtoHWE, _islessLex
    end
    @reexport using CodingTheory.WeightDistMod
end
