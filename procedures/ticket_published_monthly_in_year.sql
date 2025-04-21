CREATE DEFINER=`dovan2004`@`%` PROCEDURE `TicketPublishedMonthlyInYear`(IN p_year INT)
BEGIN
    SELECT 
        CONCAT(MONTH(publish_date), '/', YEAR(publish_date)) AS month_year,
        CountPublishedTicketsByMonthYear(month(publish_date), year(publish_date)) as ticket_counts
    FROM 
        ticket
    WHERE 
        YEAR(publish_date) = p_year
    GROUP BY 
        CONCAT(MONTH(publish_date), '/', YEAR(publish_date)), 
        CountPublishedTicketsByMonthYear(month(publish_date), year(publish_date));
END