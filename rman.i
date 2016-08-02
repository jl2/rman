%module rman

typedef short RtBoolean;
typedef float RtFloat;

/* Define RtInt as a 32 bit signed integer */
typedef int RtInt;

typedef const char *RtToken;

typedef RtFloat RtColor[3];
typedef RtFloat RtPoint[3];
typedef RtFloat RtVector[3];
typedef RtFloat RtNormal[3];
typedef RtFloat RtHpoint[4];
typedef RtFloat RtMatrix[4][4];
typedef RtFloat RtBasis[4][4];
typedef RtFloat RtBound[6];          /* [xmin xmax ymin ymax zmin zmax] */
typedef RtFloat RtInterval[2];
typedef const char *RtString;

typedef void *RtPointer;

#define RtVoid void

typedef RtFloat (*RtFilterFunc)(RtFloat, RtFloat, RtFloat, RtFloat);
typedef RtVoid  (*RtErrorHandler)(RtInt, RtInt, const char *);

typedef RtVoid (*RtProcSubdivFunc)(RtPointer, RtFloat);
typedef RtVoid (*RtProcFreeFunc)(RtPointer);
typedef RtVoid (*RtArchiveCallback)(RtToken, const char *, ...);

typedef RtPointer RtObjectHandle;
typedef RtPointer RtLightHandle;
typedef RtPointer RtContextHandle;
typedef RtPointer RtArchiveHandle;
typedef RtPointer RtVolumeHandle;


/* ===========================================================================
    Constant definitions
   =========================================================================*/

#define RI_FALSE        0
#define RI_TRUE         (!RI_FALSE)
#define RI_INFINITY     1.0e38f
#define RI_EPSILON      1.0e-10f
#define RI_NULL         ((char*)0)


extern RtToken RI_FRAMEBUFFER;
extern RtToken RI_FILE;
extern RtToken RI_ZFILE;

extern RtToken RI_RGB;
extern RtToken RI_RGBA;
extern RtToken RI_RGBZ;
extern RtToken RI_RGBAZ;
extern RtToken RI_A;
extern RtToken RI_Z;
extern RtToken RI_AZ;

extern RtToken RI_PERSPECTIVE;
extern RtToken RI_ORTHOGRAPHIC;

extern RtToken RI_HIDDEN;
extern RtToken RI_PAINT;
extern RtToken RI_RAYTRACE;
extern RtToken RI_PHOTON;

extern RtToken RI_CONSTANT;
extern RtToken RI_SMOOTH;

extern RtToken RI_FLATNESS;
extern RtToken RI_FOV;

extern RtToken RI_AMBIENTLIGHT;
extern RtToken RI_POINTLIGHT;
extern RtToken RI_DISTANTLIGHT;
extern RtToken RI_SPOTLIGHT;

extern RtToken RI_INTENSITY;
extern RtToken RI_LIGHTCOLOR;
extern RtToken RI_FROM;
extern RtToken RI_TO;
extern RtToken RI_CONEANGLE;
extern RtToken RI_CONEDELTAANGLE;
extern RtToken RI_BEAMDISTRIBUTION;

extern RtToken RI_MATTE;
extern RtToken RI_METAL;
extern RtToken RI_SHINYMETAL;
extern RtToken RI_PLASTIC;
extern RtToken RI_PAINTEDPLASTIC;

extern RtToken RI_KA;
extern RtToken RI_KD;
extern RtToken RI_KS;
extern RtToken RI_ROUGHNESS;
extern RtToken RI_KR;
extern RtToken RI_TEXTURENAME;
extern RtToken RI_SPECULARCOLOR;

extern RtToken RI_DEPTHCUE;
extern RtToken RI_FOG;
extern RtToken RI_BUMPY;

extern RtToken RI_MINDISTANCE;
extern RtToken RI_MAXDISTANCE;
extern RtToken RI_BACKGROUND;
extern RtToken RI_DISTANCE;
extern RtToken RI_AMPLITUDE;

extern RtToken RI_RASTER;
extern RtToken RI_SCREEN;
extern RtToken RI_CAMERA;
extern RtToken RI_WORLD;
extern RtToken RI_OBJECT;

extern RtToken RI_INSIDE;
extern RtToken RI_OUTSIDE;
extern RtToken RI_LH;
extern RtToken RI_RH;

extern RtToken RI_P;
extern RtToken RI_PZ;
extern RtToken RI_PW;
extern RtToken RI_N;
extern RtToken RI_NP;
extern RtToken RI_CS;
extern RtToken RI_OS;
extern RtToken RI_S;
extern RtToken RI_T;
extern RtToken RI_ST;

extern RtToken RI_BILINEAR;
extern RtToken RI_BICUBIC;

extern RtToken RI_PRIMITIVE;
extern RtToken RI_INTERSECTION;
extern RtToken RI_UNION;
extern RtToken RI_DIFFERENCE;

extern RtToken RI_PERIODIC;
extern RtToken RI_NONPERIODIC;
extern RtToken RI_CLAMP;
extern RtToken RI_BLACK;

extern RtToken RI_IGNORE;
extern RtToken RI_PRINT;
extern RtToken RI_ABORT;
extern RtToken RI_HANDLER;

extern RtToken RI_BOUNDS;

extern RtToken RI_LIMITS;
extern RtToken RI_SHADOW;
extern RtToken RI_BIAS0;
extern RtToken RI_BIAS1;
extern RtToken RI_SAMPLE;

extern RtToken RI_SEARCHPATH;
extern RtToken RI_SHADER;
extern RtToken RI_TEXTURE;
extern RtToken RI_DISPLAY;

extern RtToken RI_WIDTH, RI_CONSTANTWIDTH;

extern RtToken RI_COMMENT;
extern RtToken RI_STRUCTURE;
extern RtToken RI_VERBATIM;

extern RtToken RI_IDENTIFIER;
extern RtToken RI_NAME;
extern RtToken RI_SHADINGGROUP;

extern RtToken RI_SEARCHPATH;
extern RtToken RI_SHADER;
extern RtToken RI_TEXTURE;

/* ===========================================================================
    Curves
   =========================================================================*/

extern RtToken RI_LINEAR;
extern RtToken RI_CUBIC;

/* ===========================================================================
    3delight tokens declaration
   =========================================================================*/

extern RtToken RI_BUCKETSENDER;
extern RtToken RI_FUNCTION;

extern RtToken RI_THRESHOLD;
extern RtToken RI___THRESHOLD;

extern RtToken RI_HANDLEID;
extern RtToken RI___HANDLEID;

extern RtToken RI_ASYNCHRONOUS_RENDER;
extern RtToken RI_FINISHRENDERING;
extern RtToken RI_SUSPENDRENDERING;
extern RtToken RI_STREAMMARKER;

/* ===========================================================================
    Standard display parameters
   =========================================================================*/

extern RtToken RI_QUANTIZE;
extern RtToken RI_DITHER;
extern RtToken RI_EXPOSURE;
extern RtToken RI_FILTER;
extern RtToken RI_FILTERWIDTH;

/* ===========================================================================
    Patch basis stuff
   =========================================================================*/

extern RtBasis RiBezierBasis;
extern RtBasis RiBSplineBasis;
extern RtBasis RiCatmullRomBasis;
extern RtBasis RiHermiteBasis;
extern RtBasis RiPowerBasis;

extern RtInt RI_BEZIERSTEP;
extern RtInt RI_BSPLINESTEP;
extern RtInt RI_CATMULLROMSTEP;
extern RtInt RI_HERMITESTEP;
extern RtInt RI_POWERSTEP;

/* ===========================================================================
    Renderman Interface calls
   =========================================================================*/

RtVoid RiBegin(RtToken name);
RtVoid RiEnd(void);
RtContextHandle RiGetContext(void);
RtVoid RiContext(RtContextHandle handle);
RtVoid RiFrameBegin(RtInt frame);
RtVoid RiFrameEnd(void);
RtVoid RiMotionBegin(RtInt n, ...);
RtVoid RiMotionBeginV(RtInt n, RtFloat times[]);
RtVoid RiMotionEnd(void);
RtVoid RiSolidBegin(RtToken operation);
RtVoid RiSolidEnd(void);
RtVoid RiWorldBegin(void);
RtVoid RiWorldEnd(void);
RtObjectHandle RiObjectBegin( void );
RtObjectHandle RiObjectBeginV(
	RtInt n, const RtToken tokens[], RtPointer params[] );
RtVoid RiObjectEnd(void);
RtVoid RiObjectInstance(RtObjectHandle handle);

RtVoid RiResource(RtToken handle, RtToken type, ...);
RtVoid RiResourceV(
		RtToken handle, RtToken type,
		RtInt n, const RtToken tokens[], RtPointer params[]);
RtVoid RiResourceBegin(void);
RtVoid RiResourceEnd(void);

RtVoid RiFormat(RtInt xres, RtInt yres, RtFloat aspect);
RtVoid RiFrameAspectRatio(RtFloat aspect);
RtVoid RiScreenWindow(RtFloat left, RtFloat right,
								RtFloat bottom, RtFloat top);
RtVoid RiClipping(RtFloat hither, RtFloat yon);
RtVoid RiClippingPlane(
	RtFloat x, RtFloat y, RtFloat z, RtFloat nx, RtFloat ny, RtFloat nz );

RtVoid RiCropWindow(RtFloat xmin, RtFloat xmax,
							  RtFloat ymin, RtFloat ymax);
RtVoid RiDepthOfField(RtFloat fstop, RtFloat focallength,
								RtFloat focaldistance);
RtVoid RiProjection(RtToken name, ...);
RtVoid RiProjectionV(
		RtToken name,
		RtInt n, const RtToken tokens[], RtPointer parms[]);
RtVoid RiShutter(RtFloat min, RtFloat max);

RtVoid RiCamera(RtToken camera, ...);
RtVoid RiCameraV(
		RtToken camera,
		RtInt n, const RtToken tokens[], RtPointer parms[]);

RtVoid RiDisplay(
		const char *name, RtToken type, RtToken mode, ...);
RtVoid RiDisplayV(
		const char *name, RtToken type, RtToken mode,
		RtInt n, const RtToken tokens[], RtPointer parms[]);
RtVoid RiDisplayChannel(const char *channel, ...);
RtVoid RiDisplayChannelV(
		const char *channel,
		RtInt n, const RtToken tokens[], RtPointer params[]);
RtVoid RiExposure(RtFloat gain, RtFloat gamma);
RtVoid RiImager(RtToken name, ...);
RtVoid RiImagerV(
		RtToken name,
		RtInt n, const RtToken tokens[], RtPointer parms[]);
RtVoid RiPixelFilter(RtFilterFunc filterfunc,
							   RtFloat xwidth, RtFloat ywidth);
RtVoid RiPixelSamples(RtFloat xsamples, RtFloat ysamples);
RtVoid RiPixelVariance(RtFloat variation);
RtVoid RiQuantize(RtToken type, RtInt one, RtInt min,
							RtInt max, RtFloat ampl);

RtVoid RiConcatTransform(RtMatrix transform);
RtVoid RiCoordinateSystem(RtToken space);
RtVoid RiScopedCoordinateSystem(RtToken space);
RtVoid RiCoordSysTransform(RtToken space);
RtVoid RiIdentity(void);
RtVoid RiPerspective(RtFloat fov);
RtVoid RiRotate(RtFloat angle,
						  RtFloat dx, RtFloat dy, RtFloat dz);
RtVoid RiScale(RtFloat dx, RtFloat dy, RtFloat dz);
RtVoid RiSkew(RtFloat angle,
						RtFloat dx1, RtFloat dy1, RtFloat dz1,
						RtFloat dx2, RtFloat dy2, RtFloat dz2);
RtVoid RiTransform(RtMatrix transform);
RtVoid RiTransformBegin(void);
RtVoid RiTransformEnd(void);
RtVoid RiTranslate(RtFloat dx, RtFloat dy, RtFloat dz);
RtPoint* RiTransformPoints(RtToken fromspace,
									 RtToken tospace,
									 RtInt n, RtPoint points[]);

RtVoid RiAtmosphere(RtToken name, ...);
RtVoid RiAtmosphereV(
		RtToken name, RtInt n, const RtToken tokens[], RtPointer parms[]);
RtVoid RiDeformation(RtToken name, ...);
RtVoid RiDeformationV(
		RtToken name,
		RtInt n, const RtToken tokens[], RtPointer parms[]);
RtVoid RiDisplacement(RtToken name, ...);
RtVoid RiDisplacementV(
		RtToken name,
		RtInt n, const RtToken tokens[], RtPointer parms[]);
RtVoid RiExterior(RtToken name, ...);
RtVoid RiExteriorV(
		RtToken name,
		RtInt n, const RtToken tokens[], RtPointer parms[]);
RtVoid RiIlluminate(RtLightHandle light, RtBoolean onoff);
RtVoid RiInterior(RtToken name, ...);
RtVoid RiInteriorV(
		RtToken name,
		RtInt n, const RtToken tokens[], RtPointer parms[]);

RtVoid RiShader(RtToken name, RtToken handle, ...);
RtVoid RiShaderV( RtToken name, RtToken handle,
	RtInt n, const RtToken tokens[], RtPointer parms[]);

RtVoid RiMatte(RtBoolean onoff);
RtVoid RiMultiplyShadingRate(RtFloat ratemultiplier);
RtVoid RiShadingRate(RtFloat size);
RtVoid RiShadingInterpolation(RtToken type);
RtVoid RiSurface(RtToken name, ...);
RtVoid RiSurfaceV(
		RtToken name,
		RtInt n, const RtToken tokens[], RtPointer parms[]);

RtVoid RiArchiveRecord(RtToken type, const char *format, ...);
RtVoid RiReadArchive(
		RtToken name, RtArchiveCallback callback, ...);
RtVoid RiReadArchiveV(
		RtToken name, RtArchiveCallback callback,
		RtInt n, const RtToken tokens[], RtPointer parms[]);

RtArchiveHandle RiArchiveBegin(RtToken archivename, ...);
RtArchiveHandle RiArchiveBeginV(
		RtToken archivename,
		RtInt n, const RtToken tokens[], RtPointer params[]);
RtVoid RiArchiveEnd(void);

RtVoid RiIfBegin(RtToken expression, ...);
RtVoid RiIfBeginV(
		RtToken expression,
		RtInt n, const RtToken tokens[], RtPointer params[]);
RtVoid RiElseIf(RtToken expression, ...);
RtVoid RiElseIfV(
		RtToken expression,
		RtInt n, const RtToken tokens[], RtPointer params[]);
RtVoid RiElse(void);
RtVoid RiIfEnd(void);

RtVoid RiAttribute(RtToken name, ...);
RtVoid RiAttributeV(
		RtToken name,
		RtInt n, const RtToken tokens[], RtPointer parms[]);
RtVoid RiAttributeBegin(void);
RtVoid RiAttributeEnd(void);
RtVoid RiBound( RtBound bound );
RtVoid RiColor( RtColor color );
RtVoid RiOpacity(RtColor color);
RtVoid RiOption(RtToken name, ...);
RtVoid RiOptionV(
		RtToken name,
		RtInt n, const RtToken tokens[], RtPointer parms[]);
RtVoid RiReverseOrientation(void);
RtVoid RiTextureCoordinates(RtFloat s1, RtFloat t1,
									  RtFloat s2, RtFloat t2,
									  RtFloat s3, RtFloat t3,
									  RtFloat s4, RtFloat t4);
RtVoid RiSides(RtInt sides);

RtToken RiDeclare(const char *name, const char *declaration);

RtLightHandle RiLightSource(RtToken name, ...);
RtLightHandle RiLightSourceV(
		RtToken name,
		RtInt n, const RtToken tokens[], RtPointer parms[]);

RtLightHandle RiAreaLightSource(RtToken name, ...);
RtLightHandle RiAreaLightSourceV(
		RtToken name,
		RtInt n, const RtToken tokens[], RtPointer parms[]);

RtVoid RiBasis(RtBasis ubasis, RtInt ustep,
						 RtBasis vbasis, RtInt vstep);
RtVoid RiPatch(RtToken type, ...);
RtVoid RiPatchMesh(RtToken type, RtInt nu, RtToken uwrap,
							 RtInt nv, RtToken vwrap, ...);
RtVoid RiPatchV(
		RtToken type,
		RtInt n, const RtToken tokens[], RtPointer parms[]);
RtVoid RiPatchMeshV(
		RtToken type,
		RtInt nu, RtToken uwrap,
		RtInt nv, RtToken vwrap,
		RtInt n, const RtToken tokens[], RtPointer parms[]);
RtVoid RiPoints(RtInt npoints, ...);
RtVoid RiPointsV(
		RtInt npoints,
		RtInt n, const RtToken tokens[], RtPointer parms[]);
RtVoid RiCurves(RtToken type, RtInt ncurves,
						  RtInt nvertices[], RtToken wrap, ...);
RtVoid RiCurvesV(
		RtToken type, RtInt ncurves,
		RtInt nvertices[], RtToken wrap,
		RtInt n, const RtToken tokens[], RtPointer parms[]);
RtVoid RiNuCurves(
		RtInt ncurves, RtInt nvertices[],
		RtInt order[], RtFloat knot[],
		RtFloat min[], RtFloat max[], ...);
RtVoid RiNuCurvesV(
		RtInt ncurves, RtInt nvertices[],
		RtInt order[], RtFloat knot[],
		RtFloat min[], RtFloat max[],
		RtInt n, const RtToken tokens[],
		RtPointer params[]);

RtVoid RiNuPatch(RtInt nu, RtInt uorder, RtFloat uknot[],
						   RtFloat umin, RtFloat umax,
						   RtInt nv, RtInt vorder, RtFloat vknot[],
						   RtFloat vmin, RtFloat vmax, ...);
RtVoid RiNuPatchV(RtInt nu, RtInt uorder, RtFloat uknot[],
							RtFloat umin, RtFloat umax,
							RtInt nv, RtInt vorder, RtFloat vknot[],
							RtFloat vmin, RtFloat vmax, RtInt n,
							const RtToken tokens[], RtPointer parms[]);
RtVoid RiTrimCurve(RtInt nloops, RtInt ncurves[],
							 RtInt order[], RtFloat knot[],
							 RtFloat min[], RtFloat max[], RtInt n[],
							 RtFloat u[], RtFloat v[], RtFloat w[]);

RtVoid RiSubdivisionMesh(
		RtToken scheme,
		RtInt nfaces, RtInt nvertices[], RtInt vertices[],
		RtInt ntags, const RtToken tags[], RtInt nargs[],
		RtInt intargs[], RtFloat floatargs[],
		...);
RtVoid RiSubdivisionMeshV(
		RtToken scheme,
		RtInt nfaces, RtInt nvertices[], RtInt vertices[],
		RtInt ntags, const RtToken tags[], RtInt nargs[],
		RtInt intargs[], RtFloat floatargs[],
		RtInt n, const RtToken tokens[], RtPointer parms[]);

RtVoid RiHierarchicalSubdivisionMesh(
		RtToken scheme,
		RtInt nfaces, RtInt nvertices[], RtInt vertices[],
		RtInt ntags, const RtToken tags[], RtInt nargs[],
		RtInt intargs[], RtFloat floatargs[], const RtToken stringargs[],
		...);
RtVoid RiHierarchicalSubdivisionMeshV(
		RtToken scheme,
		RtInt nfaces, RtInt nvertices[], RtInt vertices[],
		RtInt ntags, const RtToken tags[], RtInt nargs[],
		RtInt intargs[], RtFloat floatargs[], const RtToken stringargs[],
		RtInt n, const RtToken tokens[], RtPointer params[]);

RtVoid RiCone(RtFloat height, RtFloat radius,
						RtFloat thetamax, ...);
RtVoid RiConeV(
		RtFloat height, RtFloat radius,
		RtFloat thetamax, RtInt n,
		const RtToken tokens[], RtPointer parms[]);
RtVoid RiCylinder(RtFloat radius,RtFloat zmin,RtFloat zmax,
							RtFloat thetamax,...);
RtVoid RiCylinderV(
		RtFloat radius,RtFloat zmin,RtFloat zmax,
		RtFloat thetamax, RtInt n,
		const RtToken tokens[], RtPointer parms[]);
RtVoid RiDisk(RtFloat height, RtFloat radius,
						RtFloat thetamax, ...);
RtVoid RiDiskV(
		RtFloat height, RtFloat radius,
		RtFloat thetamax, RtInt n,
		const RtToken tokens[], RtPointer parms[]);
RtVoid RiHyperboloid(RtPoint point1, RtPoint point2,
							   RtFloat thetamax, ...);
RtVoid RiHyperboloidV(
		RtPoint point1, RtPoint point2,
		RtFloat thetamax, RtInt n,
		const RtToken tokens[], RtPointer parms[]);
RtVoid RiParaboloid(RtFloat rmax,RtFloat zmin,RtFloat zmax,
							  RtFloat thetamax,...);
RtVoid RiParaboloidV(
		RtFloat rmax,RtFloat zmin,RtFloat zmax,
		RtFloat thetamax, RtInt n,
		const RtToken tokens[], RtPointer parms[]);
RtVoid RiSphere(RtFloat radius,RtFloat zmin,RtFloat zmax,
						  RtFloat thetamax, ...);
RtVoid RiSphereV(
		RtFloat radius,RtFloat zmin,RtFloat zmax,
		RtFloat thetamax, RtInt n,
		const RtToken tokens[], RtPointer parms[]);
RtVoid RiTorus(RtFloat majorradius, RtFloat minorradius,
						 RtFloat phimin, RtFloat phimax,
						 RtFloat thetamax, ...);
RtVoid RiTorusV(
		RtFloat majorradius, RtFloat minorradius,
		RtFloat phimin, RtFloat phimax,
		RtFloat thetamax, RtInt n,
		const RtToken tokens[], RtPointer parms[]);

RtVoid RiGeneralPolygon(RtInt nloops,
								  RtInt nvertices[], ...);
RtVoid RiGeneralPolygonV(
		RtInt nloops, RtInt nvertices[],
		RtInt n, const RtToken tokens[], RtPointer parms[]);

RtVoid RiBlobby(
	RtInt nleaf,
	RtInt nentry, RtInt entry[],
	RtInt nfloat, RtFloat floats[],
	RtInt nstring, RtString strings[], ...);
RtVoid RiBlobbyV(
	RtInt nleaf,
	RtInt nentry, RtInt entry[],
	RtInt nfloat, RtFloat floats[],
	RtInt nstring, RtString strings[],
	RtInt n, const RtToken tokens[], RtPointer parms[]);

RtVoid RiPointsGeneralPolygons(RtInt npolys, RtInt nloops[],
										 RtInt nvertices[],
										 RtInt vertices[], ...);
RtVoid RiPointsGeneralPolygonsV(
		RtInt npolys, RtInt nloops[],
		RtInt nvertices[],
		RtInt vertices[],
		RtInt n, const RtToken tokens[], RtPointer parms[]);
RtVoid RiPointsPolygons(RtInt npolys, RtInt nvertices[],
								  RtInt vertices[], ...);
RtVoid RiPointsPolygonsV(
		RtInt npolys, RtInt nvertices[],
		RtInt vertices[],
		RtInt n, const RtToken tokens[], RtPointer parms[]);
RtVoid RiPolygon(RtInt nvertices, ...);
RtVoid RiPolygonV(
		RtInt nvertices,
		RtInt n, const RtToken tokens[], RtPointer parms[]);

RtVoid RiColorSamples(RtInt n, RtFloat nRGB[],
								RtFloat RGBn[]);
RtVoid RiHider(RtToken type, ...);
RtVoid RiHiderV(
		RtToken type,
		RtInt n, const RtToken tokens[], RtPointer parms[]);
RtVoid RiDetail(RtBound bound);
RtVoid RiDetailRange(RtFloat minvisible,
							   RtFloat lowertransition,
							   RtFloat uppertransition,
							   RtFloat maxvisible);
RtVoid RiGeometricApproximation(RtToken type, RtFloat value);
RtVoid RiGeometry(RtToken type, ...);
RtVoid RiGeometryV(
		RtToken type,
		RtInt n, const RtToken tokens[], RtPointer parms[]);
RtVoid RiOrientation(RtToken orientation);
RtVoid RiProcedural(
	RtPointer i_data, RtBound i_bound,
	RtVoid (*i_Subdivfunc)(RtPointer, RtFloat),
	RtVoid (*i_Freefunc)(RtPointer) );
RtVoid RiProceduralV(
	RtPointer i_data, RtBound i_bound,
	RtVoid (*i_Subdivfunc)(RtPointer, RtFloat),
	RtVoid (*i_Freefunc)(RtPointer),
	RtInt n, const RtToken tokens[], RtPointer params[] );
RtVoid RiRelativeDetail(RtFloat relativedetail);
RtVoid RiProcDelayedReadArchive(RtPointer data,
										  RtFloat detail);
RtVoid RiProcDynamicLoad(RtPointer data, RtFloat detail);
RtVoid RiProcRunProgram(RtPointer data, RtFloat detail);
/*
	WARNING: On windows, you should provide your own RiProcFree if you allocate
	the memory yourself. It is not safe to allocate in a module (exe or dll)
	and free in another.
*/
RtVoid RiProcFree(RtPointer data);

RtVoid RiMakeBump(
		const char *picturename, const char *texturename,
		RtToken swrap, RtToken twrap,
		RtFilterFunc filterfunc,
		RtFloat swidth, RtFloat twidth, ... );
RtVoid RiMakeBumpV(
		const char *picturename, const char *texturename,
		RtToken swrap, RtToken twrap,
		RtFilterFunc filterfunc,
		RtFloat swidth, RtFloat twidth,
		RtInt n, const RtToken tokens[],
		RtPointer parms[] );
RtVoid RiMakeCubeFaceEnvironment(
		const char *px, const char *nx,
		const char *py, const char *ny,
		const char *pz, const char *nz,
		const char *texturename,
		RtFloat fov,
		RtFilterFunc filterfunc,
		RtFloat swidth,
		RtFloat twidth, ... );
RtVoid RiMakeCubeFaceEnvironmentV(
		const char *px, const char *nx,
		const char *py, const char *ny,
		const char *pz, const char *nz,
		const char *texturename,
		RtFloat fov,
		RtFilterFunc filterfunc,
		RtFloat swidth,
		RtFloat twidth,
		RtInt n,
		const RtToken tokens[],
		RtPointer parms[] );
RtVoid RiMakeLatLongEnvironment(
		const char *picturename,
		const char *texturename,
		RtFilterFunc filterfunc,
		RtFloat swidth,
		RtFloat twidth, ... );
RtVoid RiMakeLatLongEnvironmentV(
		const char *picturename,
		const char *texturename,
		RtFilterFunc filterfunc,
		RtFloat swidth,
		RtFloat twidth,
		RtInt n,
		const RtToken tokens[],
		RtPointer parms[] );
RtVoid RiMakeShadow(
		const char *picturename,
		const char *texturename, ... );
RtVoid RiMakeShadowV(
		const char *picturename,
		const char *texturename,
		RtInt n,
		const RtToken tokens[],
		RtPointer parms[] );
RtVoid RiMakeTexture(
		const char *picturename, const char *texturename,
		RtToken swrap, RtToken twrap,
		RtFilterFunc filterfunc,
		RtFloat swidth, RtFloat twidth, ... );
RtVoid RiMakeTextureV(
		const char *picturename, const char *texturename,
		RtToken swrap, RtToken twrap,
		RtFilterFunc filterfunc,
		RtFloat swidth, RtFloat twidth,
		RtInt n, const RtToken tokens[],
		RtPointer parms[] );

RtVoid RiMakeBrickMap(
		RtInt nptc, const char *const *ptcnames, const char *bkmname, ...);
RtVoid RiMakeBrickMapV(
		RtInt nptc, const char *const *ptcnames, const char *bkmname,
		RtInt n, const RtToken tokens[], RtPointer params[]);

RtFloat RiBoxFilter(RtFloat x, RtFloat y,
							  RtFloat xwidth, RtFloat ywidth);
RtFloat RiTriangleFilter(RtFloat x, RtFloat y,
								   RtFloat xwidth, RtFloat ywidth);
RtFloat RiCatmullRomFilter(RtFloat x, RtFloat y,
									 RtFloat xwidth, RtFloat ywidth);
RtFloat RiSeparableCatmullRomFilter(RtFloat x, RtFloat y,
									 RtFloat xwidth, RtFloat ywidth);
RtFloat RiBesselFilter(RtFloat x, RtFloat y,
								 RtFloat xwidth, RtFloat ywidth);
RtFloat RiGaussianFilter(RtFloat x, RtFloat y,
								   RtFloat xwidth, RtFloat ywidth);
RtFloat RiSincFilter(RtFloat x, RtFloat y, RtFloat xwidth, RtFloat ywidth);
RtFloat RiBlackmanHarrisFilter(RtFloat i_x, RtFloat i_y, RtFloat i_filterXWidth, RtFloat i_filteryWidth);
RtFloat RiMitchellFilter(RtFloat i_x, RtFloat i_y, RtFloat i_filterXWidth, RtFloat i_filteryWidth);
RtFloat RiDiskFilter(RtFloat i_x, RtFloat i_y, RtFloat i_filterXWidth, RtFloat i_filteryWidth);


RtVoid RiErrorHandler( RtErrorHandler handler);
RtVoid RiErrorIgnore(RtInt code, RtInt severity, const char *msg);
RtVoid RiErrorPrint(RtInt code, RtInt severity, const char *msg);
RtVoid RiErrorAbort(RtInt code, RtInt severity, const char *msg);

RtVoid RiSynchronize(RtToken);


RtVoid RiEditBegin( RtToken name, ... );
RtVoid RiEditBeginV(
		RtToken name,
		RtInt n, const RtToken tokens[], RtPointer params[] );
RtVoid RiEditEnd();

RtVoid RiEditWorldBegin( RtToken name, ... );
RtVoid RiEditWorldBeginV(
		RtToken name,
		RtInt n, const RtToken tokens[], RtPointer params[] );
RtVoid RiEditWorldEnd();


/* ===========================================================================
    Error codes
   ===========================================================================

	 1 - 10		System and File Errors
	11 - 20		Program Limitations
	21 - 40		State Errors
	41 - 60		Parameter and Protocol Errors
	61 - 80		Execution Errors
   =========================================================================*/

#define RIE_NOERROR     ((RtInt)0)

#define RIE_NOMEM       ((RtInt)1)	 /* Out of memory */
#define RIE_SYSTEM      ((RtInt)2)	 /* Miscellaneous system error */
#define RIE_NOFILE      ((RtInt)3)	 /* File nonexistent */
#define RIE_BADFILE     ((RtInt)4)	 /* Bad file format */
#define RIE_VERSION     ((RtInt)5)	 /* File version mismatch */
#define RIE_DISKFULL    ((RtInt)6)	 /* Target disk is full */

#define RIE_INCAPABLE   ((RtInt)11)	 /* Optional RI feature */
#define RIE_UNIMPLEMENT ((RtInt)12)	 /* Unimplemented feature */
#define RIE_LIMIT       ((RtInt)13)	 /* Arbitrary program limit */
#define RIE_BUG         ((RtInt)14)	 /* Probably a bug in renderer */

#define RIE_NOTSTARTED  ((RtInt)23)	 /* RiBegin not called */
#define RIE_NESTING     ((RtInt)24)	 /* Bad begin-end nesting */
#define RIE_NOTOPTIONS  ((RtInt)25)	 /* Invalid state for options */
#define RIE_NOTATTRIBS  ((RtInt)26)	 /* Invalid state for attribs */
#define RIE_NOTPRIMS    ((RtInt)27)	 /* Invalid state for primitives */
#define RIE_ILLSTATE    ((RtInt)28)	 /* Other invalid state */
#define RIE_BADMOTION   ((RtInt)29)	 /* Badly formed motion block */
#define RIE_BADSOLID    ((RtInt)30)	 /* Badly formed solid block */

#define RIE_BADTOKEN    ((RtInt)41)	 /* Invalid token for request */
#define RIE_RANGE       ((RtInt)42)	 /* Parameter out of range */
#define RIE_CONSISTENCY ((RtInt)43)	 /* Parameters inconsistent */
#define RIE_BADHANDLE   ((RtInt)44)	 /* Bad object/light handle */
#define RIE_NOSHADER    ((RtInt)45)	 /* Can't load requested shader */
#define RIE_MISSINGDATA ((RtInt)46)	 /* Required parameters not provided */
#define RIE_SYNTAX      ((RtInt)47)	 /* Declare type syntax error */
#define RIE_TOKENREDECLARED ((RtInt)48)	 /* Redeclaration of token */

#define RIE_MATH        ((RtInt)61)	 /* Zerodivide, noninvert matrix, etc. */


#define RIE_BADATTRIB	((RtInt)140)	/* Unsupported attribute */
#define RIE_BADOPTION	((RtInt)141)	/* Unsupported option */
#define RIE_SPACEREDECLARED ((RtInt)142)/* Redeclaration of space */
#define RIE_NODISPLAY   ((RtInt)143)	/* Can't load requested display server */
#define RIE_ERRRERTOOBID  ((RtInt)144)	/* Image resolution too big */
#define RIE_ERRBADSHADERPARAM ((RtInt145)           /* Parameter is not in shader param list */
#define RIE_ERRSHADERPARAMMISMATCH ((RtInt)146)     /* Value for parameter does not match declaration */
#define RIE_ERRBADARRAYACCESSINSHADER ((RtInt)147)  /* Invalid array index done in a shader */

#define RIE_SHADER_PRINTF ((RtInt)199)  /* output of a shader's printf() */

/* ===========================================================================
    Error severity levels
   =========================================================================*/

#define RIE_INFO        ((RtInt)0) /* Rendering stats and other info */
#define RIE_WARNING     ((RtInt)1) /* Something seems wrong, maybe okay */
#define RIE_ERROR       ((RtInt)2) /* Problem. Results may be wrong */
#define RIE_SEVERE      ((RtInt)3) /* So bad you should probably abort */
