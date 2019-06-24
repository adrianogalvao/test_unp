USE TestUnP
GO

if OBJECT_ID('FK_Correntista', 'F') is null
begin
	ALTER TABLE Movimentacao ADD CONSTRAINT FK_Correntista FOREIGN KEY (IdCorrentista) REFERENCES Correntista (IdCorrentista);
end
go