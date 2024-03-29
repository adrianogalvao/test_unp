USE TestUnP
GO

CREATE OR ALTER TRIGGER TR_Atualiza_Saldo_Correntista
   ON Movimentacao
   AFTER INSERT
AS
BEGIN 
	DECLARE
		@vIdCorrentista Int,
		@vValor decimal(15,2),
		@vTipo char(1)
	
    SELECT @vValor = Valor, @vIdCorrentista = IdCorrentista, @vTipo = TipoMovimentacao FROM INSERTED

	if @vTipo = 'C'
	begin
		UPDATE Correntista SET SaldoFinanceiro = SaldoFinanceiro + @vValor
		WHERE IdCorrentista = @vIdCorrentista;
	end
	else
	if @vTipo = 'D'
	begin
		UPDATE Correntista SET SaldoFinanceiro = SaldoFinanceiro - @vValor
		WHERE IdCorrentista = @vIdCorrentista;	
	end;
END

