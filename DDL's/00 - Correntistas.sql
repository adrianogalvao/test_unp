use TestUnP
go

if not exists(select 1 from sys.tables where name = 'Correntista')
begin
	create table Correntista(
		IdCorrentista Int identity (1,1) primary key,
		Nome varchar(100) not null,
		DataCriacao datetime default getdate(),
		SaldoFinanceiro decimal(15,2)
	)
end
go