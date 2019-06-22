use TestUnP
go

CREATE OR ALTER PROCEDURE _sp_ListarMovimentacao (@IdCorrentista Int, @DataIni Date, @DataFim Date, @TipoMov char(1))
AS
BEGIN
	SELECT * FROM Movimentacao
	WHERE IdCorrentista = @IdCorrentista
	  AND DataCriacao BETWEEN @DataIni AND @DataFim
	  AND TipoMovimentacao = @TipoMov
END
GO