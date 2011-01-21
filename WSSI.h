// WSSI.h
//
// Project: Barcode Static Library for iPhone OS
// (c) 2006-2010 Softmatic. All rights reserved.
// http://www.softmatic.com

#define NUM_BARCODES	16

#define CODE_EAN8		1000
#define CODE_EAN13		1001
#define CODE_ISBN10		1002
#define CODE_ISBN13		1003
#define CODE_UPCA		1004
#define CODE_UPCE		1005
#define CODE_128		1006
#define CODE_128GS1		1007
#define CODE_25IL		1008
#define CODE_25IND		1009
#define CODE_39			1010
#define CODE_PZN		1011
#define CODE_LAETUS		1012
#define CODE_CODABAR	1013
#define CODE_DATAMATRIX	1014
#define CODE_PDF417		1015
#define CODE_QR			1016
#define CODE_DATABAR	1017

#define TCODE_EAN8		"Code EAN 8"
#define TCODE_EAN13		"Code EAN 13"
#define TCODE_ISBN10	"Code ISBN 10"
#define TCODE_ISBN13	"Code ISBN 13"
#define TCODE_UPCA		"Code UPC-A"
#define TCODE_UPCE		"Code UPC-E"
#define TCODE_128		"Code 128"
#define TCODE_128GS1	"Code 128 GS1 / EAN"
#define TCODE_25IL		"Code 2/5 Interl."
#define TCODE_25IND		"Code 2/5 Indu."
#define TCODE_39		"Code 39"
#define TCODE_PZN		"PZN PharmaCode"
#define TCODE_LAETUS	"Laetus PharmaCode"
#define TCODE_CODABAR	"Codabar"
#define TCODE_DM		"Datamatrix (2D)"
#define TCODE_PD		"PDF417 (2D)"
#define TCODE_QR		"QR (Quick Response) Code (2D)"
#define TCODE_DATABAR	"GS1 Databar"

// Code specific: Databar GS1 Subtypes 

enum dataBarSubType
{
	GS1_DB_OMNI,
	GS1_DB_STACKED_OMNI,
	GS1_DB_EXPANDED,
	GS1_DB_EXPANDED_STACKED,
	GS1_DB_TRUNCATED,
	GS1_DB_STACKED,
	GS1_DB_LIMITED
};

// Code specific: QR Code Identifiers
//
// Note for owner drawn codes using the WSSI_GetBitpatternCodeQR function: 
//
// The bitpattern routines for QR do not return a '0'/'1' string like the other 
// bitpattern functions.
//
// Instead the values in the string can be between '0' and 'E' as listed below.
// 
// A module is to be painted for the following values:
//
// QR_COL_DATA_1
// QR_COL_FINDER_SET
// QR_COL_TIMING_SET
// QR_COL_ALIGN_SET
// QR_COL_VERS_SET	
// QR_COL_FORMAT_SET

#define QR_COL_DATA_0		'0'
#define QR_COL_DATA_1		'1'
#define QR_COL_FINDER_SET	'2'
#define QR_COL_FINDER_CLEAR	'3'
#define QR_COL_ALIGN_SET	'4'
#define QR_COL_ALIGN_CLEAR	'5'
#define QR_COL_FORMAT_SET	'6'
#define QR_COL_FORMAT_CLEAR	'7'
#define QR_COL_VERS_SET		'8'
#define QR_COL_VERS_CLEAR	'9'
#define QR_COL_TIMING_SET	'A'
#define QR_COL_TIMING_CLEAR	'B'
#define QR_COL_DONTCARE		'C'
#define QR_COL_SEP			'D'
#define QR_COL_REM			'E'

// Init, Cleanup, GetCode

void WSSI_Init();
CGImageRef WSSI_GetCode(float resolution);
void WSSI_Cleanup();

// Code type

int WSSI_GetCodeType();
void WSSI_SetCodeType(int value);

// Data to encode, caller MUST NOT free returned string

char *WSSI_GetDataToEncode();
void WSSI_SetDataToEncode(char *data);

// Code properties

Boolean WSSI_GetChecksum();
void WSSI_SetChecksum(Boolean value);
float WSSI_GetModuleWidth();
void WSSI_SetModuleWidth(float value);
float WSSI_GetModuleHeight();
void WSSI_SetModuleHeight(float value);
float WSSI_GetRatio();
void WSSI_SetRatio(float value);

// EPS & License, caller MUST NOT free returned string

char *WSSI_GetEPS();
char *WSSI_GetLicense();

// Bitpattern routines, caller MUST free returned string

char *WSSI_GetBitpatternCodeEAN8(char *dataToEncode);
char *WSSI_GetBitpatternCodeEAN13(char *dataToEncode);
char *WSSI_GetBitpatternCodeEANAddon(char *dataToEncode);
char *WSSI_GetBitpatternCodeUPCA(char *dataToEncode);
char *WSSI_GetBitpatternCodeUPCE(char *dataToEncode);
char *WSSI_GetBitpatternCode25IND(char *dataToEncode);
char *WSSI_GetBitpatternCode25IL(char *dataToEncode);
char *WSSI_GetBitpatternCodeLaetus(char *dataToEncode);
char *WSSI_GetBitpatternCode39(char *dataToEncode);
char *WSSI_GetBitpatternCode128(char *dataToEncode);
char *WSSI_GetBitpatternCode128GS1(char *dataToEncode);
char *WSSI_GetBitpatternCodabar(char *dataToEncode);
char *WSSI_GetBitpatternCodeDatamatrix(char *dataToEncode, int *rows, int *cols);
char *WSSI_GetBitpatternCodePDF417(char *dataToEncode, int *rows, int *cols);
char *WSSI_GetBitpatternCodeQR(char *dataToEncode, int *rows, int *cols);
char *WSSI_GetBitpatternDatabarOmnidirectional(char *dataToEncode);
char *WSSI_GetBitpatternDatabarOmnidirectionalStacked(char *dataToEncode);
char *WSSI_GetBitpatternDatabarLimited(char *dataToEncode);
char *WSSI_GetBitpatternDatabarExpanded(char *dataToEncode);
char *WSSI_GetBitpatternDatabarExpandedStacked(char *dataToEncode);

// Output

float WSSI_GetMarginX();
void WSSI_SetMarginX(float value);
float WSSI_GetMarginY();
void WSSI_SetMarginY(float value);
float WSSI_GetReduction();
void WSSI_SetReduction(float value);

// HR, for HR Font property, caller MUST NOT free returned string

Boolean WSSI_GetHumanReadable();
void WSSI_SetHumanReadable(Boolean value);
float WSSI_GetHumanReadableSize();
void WSSI_SetHumanReadableSize(float value);
char *WSSI_GetHumanReadableFont();
void WSSI_SetHumanReadableFont(char *font);

// Code specific: Code EAN, for Addon property, caller MUST NOT free returned string

int WSSI_GetSize();
void WSSI_SetSize(int value);
float WSSI_GetReduce();
void WSSI_SetReduce(float value);
char *WSSI_GetAddon();
void WSSI_SetAddon(char *data);

// Code specific: Code 128

Boolean WSSI_GetGs1();
void WSSI_SetGs1(Boolean value);

// Code specific: PDF417

int WSSI_GetRequestCols();
void WSSI_SetRequestCols(int value);

// Code specific: QR

int WSSI_GetQrECC();
void WSSI_SetQrECC(int value);

// Code specific: Databar

int WSSI_GetDatabarSubType();
void WSSI_SetDatabarSubType(int value);

int WSSI_GetSymbolsPerRow();
void WSSI_SetSymbolsPerRow(int value);
