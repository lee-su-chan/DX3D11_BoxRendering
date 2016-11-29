cbuffer cbPerObject
{
	float4x4 gWorld;
	float4x4 gView;
	float4x4 gProj;
}

struct VertexIn
{
	float3 PosL : POSITION;
	float4 Color : COLOR;
};

struct VertexOut
{
	float4 PosH : SV_POSITION;
	float4 Color : COLOR;
};

VertexOut VS(VertexIn vin)
{
	VertexOut vout;

	vout.PosH = mul(float4(vin.PosL, 1.0f), gWorld);
	vout.PosH = mul(vout.PosH, gView);
	vout.PosH = mul(vout.PosH, gProj);

	vout.Color = vin.Color;

	return vout;
}

float4 PS(VertexOut pin) : SV_Target
{
	return pin.Color;
}

RasterizerState WireframeRS
{
	FillMode = WireFrame;
	CullMode = Back;
	FrontCounterClockwise = false;
};

technique11 ColorTech
{
	pass P0
	{
		SetVertexShader( CompileShader(vs_5_0, VS()) );
		SetPixelShader( CompileShader(ps_5_0, PS()) );

		//SetRasterizerState(WireframeRS);
	}
}