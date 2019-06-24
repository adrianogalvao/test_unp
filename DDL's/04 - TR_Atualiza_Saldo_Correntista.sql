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
	
    SELECT @vValor = Valor, @vIdCorrentista = IdCorrentista FROM INSERTED

	if @vTipo = 'C'
	begin
		UPDATE Correntista SET SaldoFinanceiro =+ @vValor
		WHERE IdCorrentista = @vIdCorrentista;
	end
	else
	begin
		UPDATE Correntista SET SaldoFinanceiro =- @vValor
		WHERE IdCorrentista = @vIdCorrentista;	
	end;
END

