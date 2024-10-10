using System;
using System.ComponentModel.DataAnnotations;
using Newtonsoft.Json;

public class Facture
{
    [Key]
    public Guid Id { get; private set; }

    [JsonIgnore]  // Le numéro de facture est visible uniquement si la mission est du type "facturé"
    public string InvoiceNumber { get; private set; }

    [ForeignKey("MissionId")]
    public virtual Mission Mission { get; set; }
    public Guid MissionId { get; set; }

    public Facture(string invoiceNumber)
    {
        Id = Guid.NewGuid();
        InvoiceNumber = invoiceNumber;
    }
}
