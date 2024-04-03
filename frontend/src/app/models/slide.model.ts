export interface Slide {
    id: number;
    tieuDe: string;
    noiDung: string;
    anh: string;
    kieu: number;
    trangThai: number;
    idCha: number;
    tenSlideCha: string
    children: Slide[];
}