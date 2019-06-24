USE TestUnP
GO

IF not EXISTS( SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Movimentacao' AND  COLUMN_NAME = 'IdCorrentista')
begin
	ALTER TABLE Movimentacao ADD IdCorrentista Int;
end;

if OBJECT_ID('FK_Correntista', 'F') is null
begin
	ALTER TABLE Movimentacao ADD CONSTRAINT FK_Correntista FOREIGN KEY (IdCorrentista) REFERENCES Correntista (IdCorrentista);
end
go