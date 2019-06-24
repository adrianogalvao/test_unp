CREATE TRIGGER TR_ATUALIZA_SALDO_CORRENTISTA
   ON Movimentacao
   AFTER INSERT
AS
BEGIN 
	DECLARE
		@vIdCorrentista Int,
		@vValor decimal(15,2)
	
    SELECT @vValor = Valor, @vIdCorrentista = IdCorrentista FROM INSERTED

	UPDATE Correntista SET SaldoFinanceiro =+ @vValor
	WHERE IdCorrentista = @vIdCorrentista;
END
GO
