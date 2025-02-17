﻿using System;
using System.Collections.Generic;

namespace Halak_backend.Models;

public partial class Tavak
{
    public int Id { get; set; }

    public string Nev { get; set; } = null!;

    public string Helyszin { get; set; } = null!;

    public virtual ICollection<Halak> Halaks { get; set; } = new List<Halak>();
}
