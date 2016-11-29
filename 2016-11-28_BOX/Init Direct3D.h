#include "d3dApp.h"

struct Vertex
{
	XMFLOAT3 Pos;
	XMFLOAT4 Color;
};

class InitDirect3DApp : public D3DApp
{
public:
	InitDirect3DApp(HINSTANCE hInstance);
	~InitDirect3DApp();

	bool Init();
	void OnResize();
	void UpdateScene(float dt);
	void DrawScene();

public:
	void BuildGeometryBuffers();
	void BuildFX();
	void BuildVertexLayout();

private:
	ID3D11Buffer* mBoxVB;
	ID3D11Buffer* mBoxIB;

	XMFLOAT4X4 mWorld;
	XMFLOAT4X4 mView;
	XMFLOAT4X4 mProj;

	ID3DX11Effect* mFX;
	ID3DX11EffectTechnique* mTech;
	ID3DX11EffectMatrixVariable* mfxWorld;
	ID3DX11EffectMatrixVariable* mfxView;
	ID3DX11EffectMatrixVariable* mfxProj;

	ID3D11InputLayout* mInputLayout;

	ID3D11RasterizerState* WireFrame;
};