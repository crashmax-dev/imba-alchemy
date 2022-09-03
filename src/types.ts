export interface IElement {
  id: number
  text: string
  isBase?: boolean
  class: string
  description: string
  recept?: string[][]
}

export interface ISettings {
  size: number
  sound: boolean
}
