CREATE DEFINER=`dovan2004`@`%` FUNCTION `CountPublishedTicketsByMonthYear`(published_month int, published_year int) RETURNS int
    READS SQL DATA
begin 
	declare ticketCounts int;
    select count(publish_date) into ticketCounts 
    from ticket 
    where month(publish_date) = published_month and year(publish_date) = published_year;
    return ticketCounts;
end