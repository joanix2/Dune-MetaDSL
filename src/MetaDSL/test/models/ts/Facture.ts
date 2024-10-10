import { Mission } from './Mission';

export class Facture {
    public readonly id: string;  // ID en lecture seule

    public readonly invoiceNumber: string;  // Le numéro de facture est visible uniquement si la mission est du type "facturé"

    public mission: Mission;  // Relation avec la mission

    constructor(id: string, invoiceNumber: string, mission: Mission) {
        this.id = id;
        this.invoiceNumber = invoiceNumber;
        this.mission = mission;
    }
}
