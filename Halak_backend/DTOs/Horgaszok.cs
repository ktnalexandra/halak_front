namespace Halak_backend.Models.DTOs
{
    public class Horgasz
    {
        public int Id { get; set; }
        public string Nev { get; set; }
        public int? Eletkor { get; set; }
        public ICollection<Fogas> Fogasoks { get; set; }
    }
}
