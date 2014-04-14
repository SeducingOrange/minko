#!/bin/bash

declare -A loaders

minko_class_suffix="Parser"

# parser_name <->		minko_class_prefix 	assimp_header_file 	assimp_class
loaders["3DS"]="		ThreeDS 		3DSLoader.h 		Discreet3DSImporter"
loaders["AC3D"]="		AC3D 			ACLoader.h		AC3DImporter"
loaders["ASE"]="		ASE 			ASELoader.h		ASEImporter"
loaders["B3D"]="		B3D			B3DImporter.h		B3DImporter"
loaders["Blender"]="            Blender			BlenderLoader.h		BlenderImporter"
loaders["BVH"]="		BVH			BVHLoader.h		BVHLoader"
loaders["COB"]="		COB			COBLoader.h		COBImporter"
loaders["Collada"]="            Collada			ColladaLoader.h		ColladaLoader"
loaders["CSM"]="		CSM			CSMLoader.h		CSMImporter"
loaders["DXF"]="		DXF			DXFLoader.h		DXFImporter"
loaders["FBX"]="		FBX			FBXImporter.h		FBXImporter"
loaders["HMP"]="		HMP			HMPLoader.h		HMPImporter"
loaders["IFC"]="		IFC			IFCLoader.h		IFCImporter"
loaders["IRR"]="		IRR			IRRLoader.h		IRRImporter"
loaders["LWO"]="		LWO			LWOLoader.h		LWOImporter"
loaders["LWS"]="		LWS			LWSLoader.h		LWSImporter"
loaders["MD2"]="		MD2			MD2Loader.h		MD2Importer"
loaders["MD3"]="		MD3			MD3Loader.h		MD3Importer"
loaders["MD5"]="		MD5			MD5Loader.h		MD5Importer"
loaders["MDC"]="		MDC			MDCLoader.h		MDCImporter"
loaders["MDL"]="		MDL			MDLLoader.h		MDLImporter"
loaders["MS3D"]="		MS3D			MS3DLoader.h		MS3DImporter"
loaders["NDO"]="		NDO			NDOLoader.h		NDOImporter"
loaders["NFF"]="		NFF			NFFLoader.h		NFFImporter"
loaders["OBJ"]="		OBJ			ObjFileImporter.h	ObjFileImporter"
loaders["OFF"]="		OFF			OFFLoader.h		OFFImporter"
# note: OgreImporter is nested in Assimp::Ogre namespace; TODO handle special case
# loaders["Ogre"]="		Ogre			OgreImporter.hpp	OgreImporter"
loaders["PLY"]="		PLY			PlyLoader.h		PLYImporter"
loaders["Q3BSP"]="		Q3BSP			Q3BSPFileImporter.h	Q3BSPFileImporter"
loaders["Q3D"]="		Q3D			Q3DLoader.h		Q3DImporter"
loaders["RAW"]="		RAW			RawLoader.h		RAWImporter"
loaders["SMD"]="		SMD			SMDLoader.h		SMDImporter"
loaders["STL"]="		STL			STLLoader.h		STLImporter"
loaders["Terragen"]="           Terragen		TerragenLoader.h	TerragenImporter"
loaders["Unreal"]="		Unreal			UnrealLoader.h		UnrealImporter"
loaders["X"]="			X			XFileImporter.h		XFileImporter"
loaders["XGL"]="		XGL			XGLLoader.h		XGLImporter"
