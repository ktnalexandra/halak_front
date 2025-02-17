namespace Halak_backend.Models.DTOs
{
    public class Halak
    {
        public int Id { get; set; }
        public string Nev { get; set; }
        public string Faj { get; set; }
        public decimal? MeretCm { get; set; }
        public int? ToId { get; set; }
        public byte[]? Kep { get; set; }
        public ICollection<Fogas>? Fogasoks { get; set; }
        public Tavak? To { get; set; }
    }

    public class Fogas
    {
        public int Id { get; set; }
    }

    public class Tavak
    {
        public int Id { get; set; }
    }
}