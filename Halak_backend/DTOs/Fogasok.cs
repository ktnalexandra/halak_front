namespace Halak_backend.Models.DTOs
{
    public class Fogasok
    {
        public int Id { get; set; }
        public int? HalId { get; set; }
        public int? HorgaszId { get; set; }
        public DateTime Datum { get; set; }
        public Halak? Hal { get; set; }
        public Horgaszok? Horgasz { get; set; }
    }

    public class Horgaszok
    {
        public int Id { get; set; }
    }
}
