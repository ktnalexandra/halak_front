using Microsoft.AspNetCore.Mvc;
using Halak_backend.Models;
using Halak_backend.Models.DTOs;
using Microsoft.EntityFrameworkCore;

namespace Halak_backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class Halak : ControllerBase
    {
        private readonly IConfiguration _configuration;

        public Halak(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        [HttpGet("halak/to")]
        public async Task<ActionResult<IEnumerable<Halak_backend.Models.DTOs.Halak>>> GetHalakToNevvelAsync()
        {
            using (var cx = new HalakContext())
                try
                {
                    var result = await (from h in cx.Halaks
                                        join t in cx.Tavaks on h.ToId equals t.Id
                                        select new
                                        {
                                            HalNev = h.Nev,
                                            ToNev = t.Nev
                                        }).ToListAsync();

                    return Ok(result);
                }
                catch (Exception ex)
                {
                    return BadRequest(ex.Message);
                }
        }

        [HttpGet("horgaszok/fogasok")]
        public async Task<ActionResult<IEnumerable<dynamic>>> GetHorgaszokHalakAsync()
        {
            using (var cx = new HalakContext())
            {
                try
                {
                    var result = await (from f in cx.Fogasoks
                                        join h in cx.Halaks on f.HalId equals h.Id
                                        join hg in cx.Horgaszoks on f.HorgaszId equals hg.Id
                                        select new
                                        {
                                            HorgaszNev = hg.Nev,
                                            HalNev = h.Nev,
                                            HalFaj = h.Faj,
                                            Datum = f.Datum
                                        }).ToListAsync();

                    return Ok(result);
                }
                catch (Exception ex)
                {
                    return BadRequest(ex.Message);
                }
            }
        }

        [HttpGet("halak/legnagyobb")]
        public async Task<ActionResult<IEnumerable<dynamic>>> GetTop3LargestFishAsync()
        {
            using (var cx = new HalakContext())
            {
                try
                {
                    var result = await cx.Halaks
                        .Where(h => h.MeretCm.HasValue)
                        .OrderByDescending(h => h.MeretCm)
                        .Take(3)
                        .Select(h => new
                        {
                            HalNev = h.Nev,
                            MeretCm = h.MeretCm
                        })
                        .ToListAsync();

                    return Ok(result);
                }
                catch (Exception ex)
                {
                    return BadRequest(ex.Message);
                }
            }
        }
    }
}